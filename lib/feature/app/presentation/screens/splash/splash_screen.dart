import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/assets_manager.dart';
import 'package:noveler/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetIt.instance<ApiClient>().storage;

  @override
  void initState() {
    navigatingSplash();
    super.initState();
  }

  void navigatingSplash() async {
    if (await storage.read(key: 'token') != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.login, (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140.w,
              height: 140.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetManager.splash),
                ),
              ),
              margin: EdgeInsets.only(bottom: 2.h),
            ),
            Text(
              "Noveler",
              style: redTextStyle.copyWith(
                fontSize: 40.sp,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
