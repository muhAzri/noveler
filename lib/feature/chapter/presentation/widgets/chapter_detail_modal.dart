import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/app/bloc/credit/credit_cubit.dart';
import 'package:noveler/feature/app/bloc/readed_chapter_cubit/readed_chapter_cubit.dart';
import 'package:noveler/feature/chapter/presentation/widgets/font_size_button.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/styles.dart';
import 'package:noveler/utils/unity_ads.dart';

void chapterModal({
  required BuildContext context,
  String? previousChapterID,
  String? nextChapterID,
  required String nowChapter,
  required ReadedChapterCubit readedCubit,
  required CreditCubit creditCubit,
}) {
  void navigate(BuildContext context, String chapterID) async {
    Navigator.pop(context);
    Timer(const Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(context, AppRoutes.chapterDetail,
          arguments: {"chapterID": chapterID});
    });
  }

  void onClick(BuildContext context, String chapterID) async {
    if (!readedCubit.isIdAlreadyAdded(chapterID)) {
      readedCubit.addIDtoCubit(chapterID);
    }

    if (creditCubit.getCredit() > 0) {
      creditCubit.decreaseCredit();
      navigate(context, chapterID);
    } else {
      UnityAdsUtils.loadAds(() {
        UnityAdsUtils.showAds(() {
          creditCubit.addCredit();
          navigate(context, chapterID);
        });
      });
    }
  }

  showModalBottomSheet(
      backgroundColor: blackColor,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (previousChapterID != null)
                FontSizeButton(
                  label: '<',
                  onTap: () {
                    onClick(context, previousChapterID);
                  },
                ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                nowChapter,
                style: whiteTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 20.w,
              ),
              if (nextChapterID != null)
                FontSizeButton(
                  label: '>',
                  onTap: () {
                    onClick(context, nextChapterID);
                  },
                ),
            ],
          ),
        );
      });
}
