import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _cachedLanguage = "cachedLanguage";
  static const String _cachedTheme = "cachedTheme";

  static String getCachedLanguage() {
    final code = prefs.getString(_cachedLanguage);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await prefs.setString(_cachedLanguage, code);
  }

  static bool getCachedTheme() {
    final code = prefs.getBool(_cachedTheme);
    return code ?? false;
  }

  static Future<void> cacheTheme(bool isDark) async {
    await prefs.setBool(_cachedTheme, isDark);
  }
}
