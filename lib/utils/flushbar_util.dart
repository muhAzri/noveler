import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(
    {required BuildContext context, String? message, Color? color}) {
  Flushbar(
    message: message ?? "Unexpected Error",
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: color ?? Colors.red,
    duration: const Duration(seconds: 2),
  ).show(context);
}
