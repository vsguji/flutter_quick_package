/*
 * @Author qian suo
 * @Date: 2021-06-08 13:37:40
 * @LastEditTime: 2022-02-21 14:07:32
 * @LastEditors: Please set LastEditors
 * @Description: 应用数据持久化
 * @FilePath: /SRetailGoods/lib/src/core/base/app_share_preferences.dart
 */

import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreferences {
  AppSharePreferences._();
  // 独立app,持久化设计
  static final AppSharePreferences shared = AppSharePreferences._();
  SharedPreferences _prefs;
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 自定义前缀
  String _prefix = "";
  // 获取值
  Future<String> getUrl(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(_prefix + key);
  }

  /// @description: 共用外部持久化
  /// @param {*}
  /// @return {*}
  void setPrefs(SharedPreferences instance, String customPrefix) {
    _prefs = instance;
    _prefix = customPrefix;
  }

  String getRequestUrl(String key) => _prefs.getString(_prefix + key);

  ///
  Future<Object> getObject(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  ///
  Future<Object> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  ///
  Future<Object> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  ///
  Future<Object> getDouble(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key);
  }

  ///
  Future<Object> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<bool> containsKey(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  Future<List<String>> getStringList(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key);
  }

  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setDouble(key, value);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }

  Future<bool> clear() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.clear();
  }

  Future<void> reload() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.reload();
  }

  Future<bool> commit() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.commit();
  }
}
