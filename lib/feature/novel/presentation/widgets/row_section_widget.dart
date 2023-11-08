import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class RowSectionWidget extends StatelessWidget {
  final String title;
  final String value;
  const RowSectionWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            width: 120.w,
            child: Text(
              value,
              style: blackTextStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
