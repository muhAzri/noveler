import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/data/form_model/login_form_model.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_button.dart';
import 'package:noveler/feature/app/presentation/widgets/custom_text_button.dart';
import 'package:noveler/feature/auth/bloc/auth_bloc.dart';
import 'package:noveler/feature/auth/presentation/widgets/form_item.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/assets_manager.dart';
import 'package:noveler/utils/flushbar_util.dart';
import 'package:noveler/utils/string_utils.dart';
import 'package:noveler/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  bool isPasswordObscured = true;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordObscured = !isPasswordObscured;
    });
  }

  bool validateForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(
                context: context,
                message: state.error.capitalize(),
              );
            }

            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.main, (route) => false);
            }
          },
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 36.h),
                  Center(
                    child: Column(
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
                          "Welcome back!",
                          style: blackTextStyle.copyWith(
                            fontSize: 24.sp,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          "Sign in to continue",
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: medium,
                              color: blackColor.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  FormItem(
                    controller: emailController,
                    hintText: "Input Your Email",
                    prefixIcon: Icons.email,
                  ),
                  FormItem(
                    controller: passwordController,
                    hintText: "Input Your Password",
                    isObscured: isPasswordObscured,
                    suffixAction: togglePasswordVisibility,
                    prefixIcon: Icons.lock,
                  ),
                  const Spacer(),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CustomButton(
                          disabled: true,
                          onTap: () {},
                          title: 'Login',
                        );
                      }

                      return CustomButton(
                        onTap: () {
                          if (validateForm()) {
                            final LoginFormModel loginForm = LoginFormModel(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            context.read<AuthBloc>().add(LoginEvent(loginForm));
                          } else {
                            showCustomSnackbar(
                              context: context,
                              message: "All fields must be filled",
                            );
                          }
                        },
                        title: 'Login',
                      );
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextCustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    title: 'Sign Up',
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
