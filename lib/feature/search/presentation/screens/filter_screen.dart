import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/form_model/search_form_model.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_button.dart';
import 'package:noveler/feature/search/bloc/genre/genre_bloc.dart';
import 'package:noveler/feature/search/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/search/presentation/widgets/filter_selection_widget.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/styles.dart';

class FilterScreen extends StatefulWidget {
  final SearchFormModel params;
  final Function(SearchFormModel) setStateParams;
  const FilterScreen(
      {super.key, required this.params, required this.setStateParams});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late SearchFormModel newParams;

  @override
  void initState() {
    newParams = widget.params.copyModel(model: widget.params);
    super.initState();
  }

  void updateParams(SearchFormModel updatedParams) {
    setState(() {
      newParams = updatedParams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const SearchFilterAppBar(),
        floatingActionButton: CustomButton(
          width: 335.w,
          height: 50.h,
          title: 'Apply Filter',
          onTap: () {
            widget.setStateParams(newParams);
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              BuildCommonFilterSection(
                newParams: newParams,
                updateParams: updateParams,
              ),
              BuildGenreFilterSection(
                newParams: newParams,
                updateParams: updateParams,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCommonFilterSection extends StatelessWidget {
  final SearchFormModel newParams;
  final Function updateParams;
  const BuildCommonFilterSection(
      {super.key, required this.newParams, required this.updateParams});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSection(title: "Status", children: [
            FilterSelectionTile(
              title: "All",
              onTap: () => updateParams(newParams.copyWith(status: '')),
              isActive: newParams.status == null || newParams.status == '',
            ),
            FilterSelectionTile(
              title: "Completed",
              onTap: () =>
                  updateParams(newParams.copyWith(status: 'completed')),
              isActive: newParams.status == 'completed',
            ),
            FilterSelectionTile(
              title: "Ongoing",
              onTap: () => updateParams(newParams.copyWith(status: 'ongoing')),
              isActive: newParams.status == 'ongoing',
            ),
            FilterSelectionTile(
              title: "Hiatus",
              onTap: () => updateParams(newParams.copyWith(status: 'hiatus')),
              isActive: newParams.status == 'hiatus',
            ),
          ])
        ],
      ),
    );
  }
}

class BuildGenreFilterSection extends StatefulWidget {
  final SearchFormModel newParams;
  final Function updateParams;
  const BuildGenreFilterSection(
      {super.key, required this.newParams, required this.updateParams});

  @override
  State<BuildGenreFilterSection> createState() =>
      _BuildGenreFilterSectionState();
}

class _BuildGenreFilterSectionState extends State<BuildGenreFilterSection> {
  @override
  void initState() {
    context.read<GenreBloc>().add(GetGenresEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: BlocConsumer<GenreBloc, GenreState>(
        listener: (context, state) {
          if (state is GenreFailed) {
            showCustomSnackbar(
                context: context, message: state.error, color: redColor);
          }
        },
        builder: (context, state) {
          if (state is GenreSuccess) {
            List<Widget> gettedGenre() {
              return state.genres
                  .map(
                    (genre) => FilterSelectionTile(
                      title: genre.name,
                      onTap: () => widget.updateParams(
                          widget.newParams.copyWith(genres: genre.id)),
                      isActive: widget.newParams.genres == genre.id,
                    ),
                  )
                  .toList();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterSection(title: "Genre", children: [
                  FilterSelectionTile(
                    title: "All",
                    onTap: () => widget
                        .updateParams(widget.newParams.copyWith(genres: '')),
                    isActive: widget.newParams.genres == null ||
                        widget.newParams.genres == '',
                  ),
                  ...gettedGenre()
                ])
              ],
            );
          }

          if (state is GenreFailed) {
            return Center(
              child: CustomButton(
                title: 'Refresh',
                onTap: () {},
                height: 56.h,
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
