import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/form_model/search_form_model.dart';
import 'package:noveler/feature/search/bloc/search/search_novel_bloc.dart';
import 'package:noveler/feature/search/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/search/presentation/widgets/grid_novel_search_item.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/styles.dart';

class SearchNovelScreen extends StatefulWidget {
  const SearchNovelScreen({super.key});

  @override
  State<SearchNovelScreen> createState() => _SearchNovelScreenState();
}

class _SearchNovelScreenState extends State<SearchNovelScreen> {
  final TextEditingController searchController =
      TextEditingController(text: '');
  final ScrollController _scrollController = ScrollController();

  bool hasMore = true;
  int page = 1;

  SearchFormModel searchParams = const SearchFormModel(
    pageSize: 12,
  );

  void fetchSearchNovel() {
    var localsearchParams = searchParams.copyWith(
      title: searchController.text,
      page: 1,
    );

    context.read<SearchNovelBloc>().add(SearchEvent(localsearchParams));
  }

  void fetchMore() {
    var localsearchParams = searchParams.copyWith(
      title: searchController.text,
      page: page + 1,
    );

    setState(() {
      page = page + 1;
    });

    context.read<SearchNovelBloc>().add(GetMoreEvent(localsearchParams));
  }

  @override
  void initState() {
    fetchSearchNovel();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchMore();
      }
    });

    super.initState();
  }

  void updateParams(SearchFormModel newParams) {
    setState(() {
      searchParams = searchParams.copyModel(model: newParams);
      context.read<SearchNovelBloc>().add(SearchEvent(searchParams));
    });
  }

  void goToFilterPage() {
    Navigator.pushNamed(context, AppRoutes.filterNovel, arguments: {
      'params': searchParams,
      'setStateParams': updateParams,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchNovelAppBar(
        appBarAction: goToFilterPage,
      ),
      body: SafeArea(
        child: BlocConsumer<SearchNovelBloc, SearchNovelState>(
          listener: (context, state) {
            if (state is SearchNovelFailed) {
              showCustomSnackbar(
                context: context,
                message: state.error,
                color: redColor,
              );
            }

            if (state is SearchNovelSuccess) {
              if (state.hasMore == false) {
                setState(() {
                  hasMore = false;
                });
              }
            }
          },
          builder: (context, state) {
            if (state is SearchNovelSuccess) {
              return Column(
                children: [
                  SearchFormField(
                    searchController: searchController,
                    onSubmit: fetchSearchNovel,
                  ),
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6.w,
                        mainAxisSpacing: 6.h,
                        mainAxisExtent: 170.h,
                      ),
                      itemCount: hasMore
                          ? state.novels.length + 3
                          : state.novels.length,
                      itemBuilder: (context, index) {
                        if (state.hasMore) {
                          if (index == state.novels.length) {
                            return const SearchNovelGridTileSkeleton();
                          }
                          if (index == state.novels.length + 1) {
                            return const SearchNovelGridTileSkeleton();
                          }
                          if (index == state.novels.length + 2) {
                            return const SearchNovelGridTileSkeleton();
                          }
                        }
                        return SearchNovelGridTile(novel: state.novels[index]);
                      },
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.searchController,
    required this.onSubmit,
  });

  final TextEditingController searchController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: blackColor.withOpacity(0.8),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: TextFormField(
        controller: searchController,
        onFieldSubmitted: (value) {
          onSubmit();
        },
        style: blackTextStyle.copyWith(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: 'Search Novels',
          hintStyle: whiteTextStyle.copyWith(
            fontSize: 14.sp,
            color: blackColor.withOpacity(0.7),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: blackColor,
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
      ),
    );
  }
}
