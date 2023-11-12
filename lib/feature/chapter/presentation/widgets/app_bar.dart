import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class ChapterListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ChapterListAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
