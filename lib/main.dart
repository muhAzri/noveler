import 'package:flutter/material.dart';
import 'package:noveler/app.dart';
import 'package:noveler/config/locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final locator = Locator();

  locator.setupDepedencyInjection();

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}
