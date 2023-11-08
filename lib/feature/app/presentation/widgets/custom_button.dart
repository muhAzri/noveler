import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final bool disabled;
  final EdgeInsetsGeometry? containerPadding;
  final Decoration? containerDecoration;
  final TextStyle? labelStyle;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.disabled = false,
    this.containerPadding,
    this.containerDecoration,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disabled) {
          onTap();
        }
      },
      child: Ink(
        height: height,
        width: width ?? double.infinity,
        padding: containerPadding ??
            EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 24.w,
            ),
        decoration: containerDecoration ??
            BoxDecoration(
              color: disabled ? redColor.withOpacity(0.6) : redColor,
              borderRadius: BorderRadius.circular(6.r),
            ),
        child: Center(
          child: Text(
            title,
            style: labelStyle ??
                whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
          ),
        ),
      ),
    );
  }
}
