import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: blackColor,
              size: 28.sp,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.chevron_right,
                color: blackColor,
                size: 18.sp,
              )
          ],
        ),
      ),
    );
  }
}
