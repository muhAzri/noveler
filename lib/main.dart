import 'package:flutter/material.dart';
import 'package:noveler/app.dart';
import 'package:noveler/config/locator.dart';
import 'package:noveler/utils/read_settings.dart';
import 'package:noveler/utils/unity_ads.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final locator = Locator();

  locator.setupDepedencyInjection();
  UnityAdsUtils.initialize();
  ReadSettings.initialize();

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}
