import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';

class RecommendedNovelTile extends StatelessWidget {
  final NovelModel novel;
  const RecommendedNovelTile({
    super.key,
    required this.novel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoutes.novelDetail,
            arguments: {"novelID": novel.id});
      },
      child: Container(
        width: 120.w,
        height: 220.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: blackColor,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: 150.w,
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
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
