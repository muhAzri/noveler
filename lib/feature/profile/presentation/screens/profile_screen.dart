import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/profile/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/profile/presentation/widgets/profile_info.dart';
import 'package:noveler/feature/profile/presentation/widgets/profile_item.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PackageInfo packageInfo;
  String version = '';

  @override
  void initState() {
    super.initState();
    retrievePackageInfo();
  }

  Future<void> retrievePackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  void profileNavigate(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        children: [
          const ProfileInfo(),
          SizedBox(
            height: 24.h,
          ),
          ProfileItem(
            icon: Icons.lock,
            title: "Privacy And Policy",
            onTap: () => profileNavigate(AppRoutes.privacyAndPolicy),
          ),
          ProfileItem(
            icon: Icons.security,
            title: "Digital Millennium Copyright Act",
            onTap: () => profileNavigate(AppRoutes.dmca),
          ),
          ProfileItem(
            icon: Icons.info,
            title: "About Us",
            onTap: () => profileNavigate(AppRoutes.aboutUs),
          ),
          ProfileItem(
            icon: Icons.settings,
            title: "Version ($version)",
          )
        ],
      ),
    );
  }
}
