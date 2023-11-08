import 'dart:async';

import 'package:noveler/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:noveler/routes/app_routes.dart';
import 'package:noveler/utils/flushbar_util.dart';

void sessionExpiredHandler() async {
  const storage = FlutterSecureStorage();
  showCustomSnackbar(
      context: navigatorKey.currentState!.context, message: "Sessions Expired");
  await storage.deleteAll();
  Timer(const Duration(seconds: 3), () {
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentState!.context,
      AppRoutes.login,
      (route) => false,
    );
  });
}
