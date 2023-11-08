import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Discover",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.searchNovel);
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        )
      ],
    );
  }
}
