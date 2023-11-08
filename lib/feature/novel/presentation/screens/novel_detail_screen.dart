import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_button.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_text_button.dart';
import 'package:noveler/feature/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:noveler/feature/novel/bloc/detail_novel/detail_novel_bloc.dart';
import 'package:noveler/feature/novel/presentation/widgets/genre_widget.dart';
import 'package:noveler/feature/novel/presentation/widgets/novel_detail_section.dart';
import 'package:noveler/feature/novel/presentation/widgets/recommended_novel_tile.dart';
import 'package:noveler/feature/novel/presentation/widgets/row_section_widget.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/styles.dart';

class NovelDetailScreen extends StatefulWidget {
  final String novelID;

  const NovelDetailScreen({super.key, required this.novelID});

  @override
  State<NovelDetailScreen> createState() => _NovelDetailScreenState();
}

class _NovelDetailScreenState extends State<NovelDetailScreen> {
  void fetchDetailNovel() {
    context
        .read<DetailNovelBloc>()
        .add(GetDetailNovelEvent(novelID: widget.novelID));
  }

  void refreshDetailNovel() {
    context
        .read<DetailNovelBloc>()
        .add(RefreshDetailNovelEvent(novelID: widget.novelID));
  }

  @override
  void initState() {
    fetchDetailNovel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: SafeArea(
        child: BlocConsumer<DetailNovelBloc, DetailNovelState>(
          listener: (context, state) {
            if (state is DetailNovelFailed) {
              showCustomSnackbar(
                context: context,
                message: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            if (state is DetailNovelFailed) {
              return Center(
                child: CustomButton(
                  title: 'Refresh',
                  onTap: () {
                    context.read<DetailNovelBloc>().add(
                          GetDetailNovelEvent(novelID: widget.novelID),
                        );
                  },
                  width: 275.w,
                  height: 60.h,
                ),
              );
            }

            if (state is DetailNovelSuccess) {
              return NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    DetailNovelAppBar(
                      innerBoxIsScrolled: innerBoxIsScrolled,
                      state: state,
                    ),
                  ];
                },
                body: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      children: [
                        DescriptionSection(state: state),
                        ContentSection(state: state),
                        GenreSection(state: state),
                        NovelInfoSection(state: state),
                        const RecommendSection(),
                        SizedBox(
                          height: 90.h,
                        )
                      ],
                    ),
                    DetailNovelBottomAppBar(
                      state: state,
                      fetchDetailNovel: refreshDetailNovel,
                    )
                  ],
                ),
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

class DetailNovelBottomAppBar extends StatelessWidget {
  final DetailNovelSuccess state;
  final VoidCallback fetchDetailNovel;

  const DetailNovelBottomAppBar({
    super.key,
    required this.state,
    required this.fetchDetailNovel,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: kToolbarHeight + 12.h,
        child: BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddToLibrary(
                  isBookmarked: state.detail.bookmarked,
                  state: state,
                  fetchDetailNovel: fetchDetailNovel,
                ),
                CustomButton(
                  title: 'Read Now',
                  onTap: () {},
                  height: 56.h,
                  width: 180.w,
                  containerPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 4.h,
                  ),
                  containerDecoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddToLibrary extends StatelessWidget {
  final bool isBookmarked;
  final DetailNovelSuccess state;
  final VoidCallback fetchDetailNovel;

  const AddToLibrary({
    super.key,
    required this.isBookmarked,
    required this.state,
    required this.fetchDetailNovel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarkBloc(),
      child: BlocListener<BookmarkBloc, BookmarkState>(
        listener: (context, state) {
          if (state is BookmarkFailed) {
            showCustomSnackbar(
              context: context,
              message: state.erorr,
              color: redColor,
            );
          }
        },
        child: Stack(
          children: [
            if (isBookmarked)
              InkWell(
                onTap: () {
                  BookmarkBloc().add(AddOrRemoveBookmarkEvent(state.detail.id));
                  fetchDetailNovel();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.remove_circle_outline,
                      color: blackColor,
                    ),
                    Text(
                      "Remove From Bookmark",
                      style: blackTextStyle.copyWith(
                        fontSize: 10.sp,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            if (!isBookmarked)
              InkWell(
                onTap: () {
                  BookmarkBloc().add(AddOrRemoveBookmarkEvent(state.detail.id));
                  fetchDetailNovel();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: blackColor,
                    ),
                    Text(
                      "Add To Bookmark",
                      style: blackTextStyle.copyWith(
                        fontSize: 10.sp,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DetailNovelAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final DetailNovelSuccess state;

  const DetailNovelAppBar({
    super.key,
    required this.innerBoxIsScrolled,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: innerBoxIsScrolled ? blackColor : whiteColor,
      ),
      elevation: 4,
      title: AppBarTitle(
        innerBoxIsScrolled: innerBoxIsScrolled,
        state: state,
      ),
      expandedHeight: 218.h,
      forceElevated: innerBoxIsScrolled,
      pinned: true,
      flexibleSpace: AppBarSpace(
        state: state,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final DetailNovelSuccess state;

  const AppBarTitle(
      {super.key, required this.innerBoxIsScrolled, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24.w),
      child: Text(
        "The Dragon Egg I Nurtured for a Thousand Years Finally Hatched",
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          color: innerBoxIsScrolled ? blackColor : whiteColor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class AppBarSpace extends StatelessWidget {
  final DetailNovelSuccess state;

  const AppBarSpace({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        color: const Color(0xffF2F3F7),
        padding: EdgeInsets.only(bottom: 8.h),
        child: Stack(
          children: [
            FlexibleSpaceBackground(
              state: state,
            ),
            AppBarContent(
              state: state,
            ),
          ],
        ),
      ),
    );
  }
}

class FlexibleSpaceBackground extends StatelessWidget {
  final DetailNovelSuccess state;

  const FlexibleSpaceBackground({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              state.detail.coverImage,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOver,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  final DetailNovelSuccess state;

  const AppBarContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      padding: EdgeInsets.only(top: 54.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarNovelImage(
            state: state,
          ),
          NovelInfo(
            state: state,
          ),
        ],
      ),
    );
  }
}

class AppBarNovelImage extends StatelessWidget {
  final DetailNovelSuccess state;

  const AppBarNovelImage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94.w,
      height: 124.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(state.detail.coverImage),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: whiteColor,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}

class NovelInfo extends StatelessWidget {
  final DetailNovelSuccess state;

  const NovelInfo({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      margin: EdgeInsets.only(left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.detail.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: whiteTextStyle.copyWith(fontSize: 16.sp, fontWeight: bold),
          ),
          Text(
            state.detail.author,
            style: whiteTextStyle.copyWith(fontSize: 14.sp, fontWeight: medium),
          ),
          Text(
            state.detail.status,
            style: whiteTextStyle.copyWith(fontSize: 14.sp, fontWeight: medium),
          ),
          SizedBox(
            height: 28.h,
          )
        ],
      ),
    );
  }
}

class DescriptionSection extends StatefulWidget {
  final DetailNovelSuccess state;

  const DescriptionSection({
    super.key,
    required this.state,
  });

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return NovelDetailSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: blackTextStyle.copyWith(
              fontWeight: extraBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            widget.state.detail.description,
            style: blackTextStyle.copyWith(
              fontWeight: light,
              fontSize: 12.sp,
            ),
            maxLines: isShowMore ? null : 4,
          ),
          SizedBox(
            height: 6.h,
          ),
          TextCustomButton(
            onTap: () {
              setState(() {
                isShowMore = !isShowMore;
              });
            },
            title: isShowMore ? "Minimze" : "Show more",
          )
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  final DetailNovelSuccess state;

  const ContentSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return NovelDetailSection(
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Contents",
              style: blackTextStyle.copyWith(
                fontWeight: extraBold,
                fontSize: 16.sp,
              ),
            ),
          ),
          GestureDetector(
            child: Text(
              "${state.detail.status} ${state.detail.chaptersCount} Chapters >",
              style: blackTextStyle.copyWith(
                fontWeight: light,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class GenreSection extends StatelessWidget {
  final DetailNovelSuccess state;

  const GenreSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return NovelDetailSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Genres",
            style: blackTextStyle.copyWith(
              fontWeight: extraBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Wrap(
            spacing: 6.w,
            runSpacing: 4.h,
            children: state.detail.genres
                .map(
                  (genre) => GenreWidget(
                    title: genre.name,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class NovelInfoSection extends StatelessWidget {
  final DetailNovelSuccess state;

  const NovelInfoSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return NovelDetailSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Novel Info",
            style: blackTextStyle.copyWith(
              fontWeight: extraBold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          RowSectionWidget(
            title: 'Status',
            value: state.detail.status,
          ),
          RowSectionWidget(
            title: 'Author',
            value: state.detail.author,
          ),
          RowSectionWidget(
            title: 'Rating',
            value: state.detail.rating.toString(),
          ),
        ],
      ),
    );
  }
}

class RecommendSection extends StatelessWidget {
  const RecommendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailNovelBloc()..add(GetRecommendedNovelEvent()),
      child: BlocBuilder<DetailNovelBloc, DetailNovelState>(
        builder: (context, state) {
          if (state is RecommendedNovelSuccess) {
            return NovelDetailSection(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You May Also Like",
                    style: blackTextStyle.copyWith(
                      fontWeight: extraBold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                    height: 1100.h,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 6.w,
                        mainAxisSpacing: 6.h,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      children: state.recommendedNovels
                          .map(
                            (novel) => RecommendedNovelTile(
                              novel: novel,
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
