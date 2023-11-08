import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/discover/bloc/discover_bloc.dart';
import 'package:noveler/feature/discover/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/discover/presentation/widgets/grid_novel_item.dart';
import 'package:noveler/feature/discover/presentation/widgets/horizontal_novel_tile.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/styles.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DiscoverAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
          children: const [
            NewStories(),
            LatestRelease(),
            NextFavorite(),
          ],
        ),
      ),
    );
  }
}

class NewStories extends StatelessWidget {
  const NewStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore Fresh Stories",
          style: blackTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocProvider(
          create: (context) => DiscoverBloc()..add(GetNewestNovelEvent()),
          child: BlocConsumer<DiscoverBloc, DiscoverState>(
            listener: (context, state) {
              if (state is DiscoverFailed) {
                showCustomSnackbar(context: context, message: "Test");
              }
            },
            builder: (context, state) {
              if (state is DiscoverSuccess) {
                return SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.novels.length,
                    itemBuilder: (context, index) {
                      return HorizontalNovelTile(
                        novel: state.novels[index],
                      );
                    },
                  ),
                );
              }

              return SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const HorizontalNovelTileSkeleton();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LatestRelease extends StatelessWidget {
  const LatestRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discover the Latest Releases",
          style: blackTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocProvider(
          create: (context) => DiscoverBloc()..add(GetNewlyUpdatedNovelEvent()),
          child: BlocConsumer<DiscoverBloc, DiscoverState>(
            listener: (context, state) {
              if (state is DiscoverFailed) {
                showCustomSnackbar(context: context, message: state.error);
              }
            },
            builder: (context, state) {
              if (state is DiscoverSuccess) {
                return SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.novels.length,
                    itemBuilder: (context, index) {
                      return HorizontalNovelTile(
                        novel: state.novels[index],
                      );
                    },
                  ),
                );
              }

              return SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const HorizontalNovelTileSkeleton();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NextFavorite extends StatelessWidget {
  const NextFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find Your Next Favorite",
          style: blackTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        BlocProvider(
          create: (context) => DiscoverBloc()..add(GetBestNovelEvent()),
          child: BlocConsumer<DiscoverBloc, DiscoverState>(
            listener: (context, state) {
              if (state is DiscoverFailed) {
                showCustomSnackbar(
                    context: context, message: state.error ?? "Unknown error");
              }
            },
            builder: (context, state) {
              if (state is DiscoverSuccess) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.novels.length,
                  itemBuilder: (context, index) {
                    return GridNovelItem(
                      novel: state.novels[index],
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.width / (76.h * 2),
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                  ),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const GridNovelItemSkeleton();
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      MediaQuery.of(context).size.width / (76.h * 2),
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
