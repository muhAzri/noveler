import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class FontSizeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const FontSizeButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: redColor),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: whiteTextStyle,
          ),
        ),
      ),
    );
  }
}

class BoldButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  const BoldButton({
    super.key,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isActive ? redColor : blackColor.withOpacity(0.2),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Icon(
            Icons.format_bold,
            size: 14.sp,
            color: isActive ? whiteColor : blackColor,
          ),
        ),
      ),
    );
  }
}
