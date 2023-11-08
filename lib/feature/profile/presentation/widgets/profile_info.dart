import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_text_button.dart';
import 'package:noveler/feature/profile/bloc/profile_bloc.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/string_utils.dart';
import 'package:noveler/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetProfileInfoEvent()),
      child:
          BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state is ProfileFailed) {
          showCustomSnackbar(context: context, message: state.error);
        }
      }, builder: (context, state) {
        if (state is ProfileSuccess) {
          return Material(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: blackColor,
                  radius: 24.r,
                  child: Text(
                    state.model.username.avatar(),
                    maxLines: 1,
                    style: whiteTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.model.username.capitalize(),
                        style: blackTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        state.model.email.capitalize(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                TextCustomButton(
                  title: "Log Out",
                  onTap: () {},
                  labelTextStyle: redTextStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          );
        }
        return Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 24.r,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.grey[300],
                      width: double.infinity,
                      height: 16.0,
                    ),
                  ),
                  // Shimmer Skeleton for Email
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.grey[300],
                      width: double.infinity,
                      height: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            TextCustomButton(
              title: "Log Out",
              onTap: () {},
              labelTextStyle: redTextStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: bold,
              ),
            )
          ],
        );
      }),
    );
  }
}
