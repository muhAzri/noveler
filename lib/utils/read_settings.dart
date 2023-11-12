import 'package:shared_preferences/shared_preferences.dart';

class ReadSettings {
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fontSize', '14');
    await prefs.setString('isBold', 'false');
  }

  static Future<void> setFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fontSize', fontSize.toString());
  }

  static Future<void> setIsBold(bool isBold) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isBold', isBold.toString());
  }

  static Future<double> getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final fontSize = prefs.getString('fontSize');
    return double.parse(fontSize!);
  }

  static Future<bool> getIsBold() async {
    final prefs = await SharedPreferences.getInstance();
    final isBold = prefs.getString('isBold');

    return bool.parse(isBold!);
  }
}
