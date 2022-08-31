import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void putString(String key, String value) {
    _preferences?.setString(key, value);
  }

  static String getString(String key, {String defaultValue = ''}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  static void putBool(String key, bool value) {
    _preferences?.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  static void putInt(String key, int value) {
    _preferences?.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  static void putDouble(String key, double value) {
    _preferences?.setDouble(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences?.getDouble(key) ?? defaultValue;
  }
}
