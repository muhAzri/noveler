import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Profile",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}

class PrivacyAndPolicyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PrivacyAndPolicyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "Privacy and Policy",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}

class DMCAAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DMCAAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "DMCA",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}

class AboutUsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AboutUsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Text(
        "About Us",
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
