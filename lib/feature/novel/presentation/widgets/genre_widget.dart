import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class GenreWidget extends StatelessWidget {
  final String title;
  const GenreWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: blackColor,
            width: 2.w,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
