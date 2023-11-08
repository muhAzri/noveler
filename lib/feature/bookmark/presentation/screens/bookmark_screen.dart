import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:noveler/feature/bookmark/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/bookmark/presentation/widgets/bookmark_grid_tile.dart';
import 'package:noveler/feature/bookmark/presentation/widgets/empty_bookmark_widget.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/styles.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  void fetchBookmark() {
    context.read<BookmarkBloc>().add(GetBookmarksEvent());
  }

  @override
  void initState() {
    fetchBookmark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookmarkAppBar(),
      body: BlocConsumer<BookmarkBloc, BookmarkState>(
        listener: (context, state) {
          if (state is BookmarkFailed) {
            showCustomSnackbar(
              context: context,
              message: state.erorr,
              color: redColor,
            );
          }
        },
        builder: (context, state) {
          if (state is GetBookmarkSuccess) {
            if (state.novels.isEmpty) {
              return const EmptyBookmarkWidget();
            }

            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  fetchBookmark();
                },
                child: BookmarkedNovelGridView(
                  state: state,
                ),
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

class BookmarkedNovelGridView extends StatelessWidget {
  final GetBookmarkSuccess state;
  const BookmarkedNovelGridView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 24.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6.w,
        mainAxisSpacing: 6.h,
        mainAxisExtent: 180.h,
      ),
      itemCount: state.novels.length,
      itemBuilder: (context, index) {
        return BookmarkGridTile(novel: state.novels[index]);
      },
    );
  }
}
