import 'package:shared_preferences/shared_preferences.dart';

class AppConfigs {
  static late SharedPreferences prefs;

  AppConfigs._();

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool get hasDir => prefs.containsKey('dir');
  static String get dir => prefs.getString('dir') ?? '/storage/emulated/0/Download';
  static set dir(String? dir) {
    if (dir != null) prefs.setString('dir', dir);
  }
}
