import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class FilterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const FilterSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
          ),
          SizedBox(
            height: 14.h,
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 14.h,
            children: children,
          )
        ],
      ),
    );
  }
}

class FilterSelectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  const FilterSelectionTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: isActive ? redColor : whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isActive ? redColor : blackColor,
                width: 1.5.w,
              ),
            ),
            child: Text(
              title,
              style: isActive
                  ? whiteTextStyle.copyWith(fontSize: 12.sp)
                  : blackTextStyle.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
