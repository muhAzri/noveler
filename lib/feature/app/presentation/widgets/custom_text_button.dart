import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class TextCustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? textColor;
  final TextStyle? labelTextStyle;

  const TextCustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.textColor,
    this.labelTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: labelTextStyle ??
          redTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: light,
          ),
    );
  }
}
