import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class GridNovelItem extends StatelessWidget {
  final NovelModel novel;

  const GridNovelItem({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.novelDetail,
            arguments: {"novelID": novel.id});
      },
      child: SizedBox(
        width: 174.w,
        height: 76.h,
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 76.h,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(
                    novel.coverImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                novel.title,
                style: blackTextStyle.copyWith(fontWeight: bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GridNovelItemSkeleton extends StatelessWidget {
  const GridNovelItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: 174.w,
        height: 76.h,
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 76.h,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: Colors
                    .grey, // Set a background color for the shimmer effect
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            Expanded(
              child: Container(
                height: 16.h, // Adjust the height of the shimmered text
                color: Colors
                    .grey, // Set a background color for the shimmer effect
              ),
            ),
          ],
        ),
      ),
    );
  }
}
