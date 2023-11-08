import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class SearchNovelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() appBarAction;
  const SearchNovelAppBar({super.key, required this.appBarAction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Search Novel",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.filter_alt_outlined,
            size: 24.sp,
          ),
          onPressed: () {
            appBarAction();
          },
        )
      ],
    );
  }
}

class SearchFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchFilterAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Apply Search Filters",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
      bottom: TabBar(
        indicatorColor: blackColor,
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.symmetric(horizontal: 12.w),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
        tabs: const [
          BuildTabBarItem(title: 'Common'),
          BuildTabBarItem(title: 'Genre'),
        ],
      ),
    );
  }
}

class BuildTabBarItem extends StatelessWidget {
  final String title;
  const BuildTabBarItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Text(
        title,
        style: blackTextStyle,
      ),
    );
  }
}
