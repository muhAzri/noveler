import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class BookmarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookmarkAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Bookmarked Novels",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
