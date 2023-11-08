import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class NovelDetailSection extends StatelessWidget {
  final Widget child;
  const NovelDetailSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: child,
    );
  }
}
