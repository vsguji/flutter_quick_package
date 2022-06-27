/*
 * @Author: your name
 * @Date: 2021-06-08 15:40:07
 * @LastEditTime: 2021-11-30 13:58:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SRetailGoods/lib/src/core/base/app_info.dart
 */
import 'package:package_info/package_info.dart';

class AppInfo {
  AppInfo._();
  static AppInfo instance = AppInfo._();
  static PackageInfo _packageInfo;
  static Future init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// @description: 获取应用版本号
  /// @param {*}
  /// @return {*}
  String appVersion() {
    return _packageInfo.version ?? "";
  }

  /// @description: 获取应用名称
  /// @param {*}
  /// @return {*}
  String appName() {
    return _packageInfo.appName ?? "";
  }

  /// @description: 获取应用构建版本
  /// @param {*}
  /// @return {*}
  String appBuildNumber() {
    return _packageInfo.buildNumber ?? "";
  }
}
