import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/utils/styles.dart';

class FormItem extends StatelessWidget {
  final String hintText;
  final bool isObscured;
  final VoidCallback? suffixAction;
  final IconData prefixIcon;
  final TextEditingController? controller;
  const FormItem({
    super.key,
    required this.hintText,
    this.isObscured = false,
    this.suffixAction,
    required this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: controller,
        obscureText: isObscured,
        style: blackTextStyle.copyWith(
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          hintStyle: blackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: light,
            color: blackColor.withOpacity(0.8),
          ),
          hintText: hintText,
          prefixIcon: Container(
            margin: EdgeInsets.only(
              right: 12.w,
            ),
            child: Icon(prefixIcon),
          ),
          suffixIcon: suffixAction != null
              ? SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: InkWell(
                    onTap: () {
                      suffixAction!();
                    },
                    child: Icon(
                      isObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
