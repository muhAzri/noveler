import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class SearchNovelGridTile extends StatelessWidget {
  final NovelModel novel;

  const SearchNovelGridTile({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.novelDetail,
            arguments: {"novelID": novel.id});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: blackColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120.h,
              child: _ImageContainer(novel.coverImage),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    novel.title,
                    style: blackTextStyle.copyWith(
                        fontWeight: bold, fontSize: 12.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: novel.rating ?? 0.0,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        unratedColor: whiteColor.withOpacity(0.4),
                        itemCount: 5,
                        itemSize: 14.sp,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        '${novel.rating ?? 0}',
                        style: blackTextStyle.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  final String novelImage;
  const _ImageContainer(this.novelImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        image: DecorationImage(
          image: NetworkImage(
            novelImage,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            blackColor.withOpacity(0.5),
            BlendMode.srcOver,
          ),
        ),
      ),
    );
  }
}

class SearchNovelGridTileSkeleton extends StatelessWidget {
  const SearchNovelGridTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
