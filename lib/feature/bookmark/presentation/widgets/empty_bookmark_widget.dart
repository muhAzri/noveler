import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/assets_manager.dart';
import 'package:noveler/utils/styles.dart';

class EmptyBookmarkWidget extends StatelessWidget {
  const EmptyBookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetManager.emptyState,
        ),
        Text(
          "You Don't Have Any\nBookmarked Novel Yet!",
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 24.sp,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
