
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class PNCItem extends StatelessWidget {
  final int index;
  final String title;
  final String content;
  const PNCItem({
    super.key,
    required this.index,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$index $title",
            style: blackTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            content,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class TopPNCItem extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  const TopPNCItem({
    super.key,
    required this.text,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: blackTextStyle.copyWith(fontWeight: fontWeight ?? medium),
      ),
    );
  }
}