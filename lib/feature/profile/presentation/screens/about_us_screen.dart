import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/constant/constant.dart';
import 'package:noveler/feature/profile/presentation/widgets/app_bar.dart';
import 'package:noveler/utils/assets_manager.dart';
import 'package:noveler/utils/styles.dart';

final String aboutUsContent = '''
${Constant.privacyAndPolicyProjectName} is an app for reading web novel with english translation we have thousands of novels collections with a lot of genres and with complete features and also with fast and simple access
''';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AboutUsAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        children: [
          Image.asset(AssetManager.splash),
          Text(
            aboutUsContent,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
