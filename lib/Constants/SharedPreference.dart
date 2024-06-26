import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  /// Adding an integer value
  static dynamic putInt(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setInt("$key", val);
    return _res;
  }

  /// Adding an boolean value
  static dynamic putBool(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setBool("$key", val);
    return _res;
  }

  /// Adding a string value
  static dynamic putString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setString("$key", val);
    return _res;
  }

  /// Adding a list or object
  /// Use import 'dart:convert'; for jsonEncode
  static dynamic putJson(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var valString = jsonEncode(val);
    var _res = prefs.setString("$key", valString);
    return _res;
  }

  ///   ----------------------------- Get methods ----------------------------- ///

  /// Get integer value
  /// Argument [key]
  static dynamic getInt(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    int? _res = prefs.getInt("$key");
    return _res;
  }

  /// Get boolean value
  /// Argument [key]
  static dynamic getBool(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    bool? _res = prefs.getBool("$key");
    return _res;
  }

  /// Get string value
  /// Argument [key]
  static dynamic getString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? _res = prefs.getString("$key");
    return _res;
  }

  /// Get list or object
  /// Use import 'dart:convert'; for jsonEncode
  /// Argument [key]
  static dynamic getJson(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? jsonString = prefs.getString("$key");
    var _res = jsonDecode(jsonString!);
    return _res;
  }

  /// Clear data
  static Future reset() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
