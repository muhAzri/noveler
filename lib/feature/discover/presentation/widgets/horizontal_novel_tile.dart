import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalNovelTile extends StatelessWidget {
  final NovelModel novel;
  const HorizontalNovelTile({
    super.key,
    required this.novel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.novelDetail,
            arguments: {"novelID": novel.id});
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.only(right: 12.w),
        width: 90.w,
        height: 200.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90.w,
              height: 120.h,
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(novel.coverImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            Text(
              novel.title,
              style: blackTextStyle.copyWith(fontWeight: bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalNovelTileSkeleton extends StatelessWidget {
  const HorizontalNovelTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.only(right: 12.w),
        width: 90.w,
        height: 200.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90.w,
              height: 120.h,
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: Colors
                    .grey, // Set a background color for the shimmer effect
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            Container(
              width: 80.w, // Adjust the width of the shimmered text
              height: 16.h, // Adjust the height of the shimmered text
              color:
                  Colors.grey, // Set a background color for the shimmer effect
            ),
          ],
        ),
      ),
    );
  }
}
