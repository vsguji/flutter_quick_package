/*
 * @Author: qian suo
 * @Date: 2020-12-29 18:17:52
 * @LastEditTime: 2022-05-30 17:42:11
 * @LastEditors: Please set LastEditors
 * @Description: 应用网络配置
 * @FilePath: /SRetailGoods/lib/src/core/base/app_config.dart
 */
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quick_package/core/api/api.dart';
import 'package:flutter_quick_package/core/base/app_model.dart';
import 'package:flutter_quick_package/core/base/app_share_preferences.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

typedef HttpCallBack = void Function(dynamic rsp, String msg);

typedef HttpLoadHud = void Function(String url);

class AppConfig {
  AppConfig._();

  static final AppConfig instance = AppConfig._();

  dynamic _config;

  String get goods => _config['goods'];

  String get customer => _config['customer'];

  String get shopIncome => _config[shopIncome];

  String get apiHost => _config['host'];

  /// 应用配置
  FutureOr<int> init(BuildContext context) async {
    final _jsonStr = await _getConfigJson(context);
    if (_jsonStr == null) {
      print('未能找到config文件');
      return Future.error("未能找到config文件");
    }
    await AppInfo.init();
    _config = json.decode(_jsonStr);
    if (_config != null) {
      return Future.value(1);
    }
    return Future.error('格式有误');
  }

  /// @description: 从json,读取网络配置
  /// @param {*}
  /// @return {*}
  Future<String> _getConfigJson(BuildContext context) async {
    try {
      final _jsonStr =
          await DefaultAssetBundle.of(context).loadString("appconfig.json");
      return _jsonStr;
    } on Exception catch (_) {
      return null;
    }
  }

  /// @description: 重新设置主网络url
  /// @param {*}
  /// @return {*}
  void resetApiHost(String url) {
    _config = {"host": url ?? ""};
  }

  // 请求
  HttpLoadHud loadHudWillCallBack;
  // 请求
  HttpLoadHud loadHudDidCallBack;
  // 错误处理
  HttpCallBack failCallBack;
  // 成功处理
  HttpCallBack successCallBack;

  /// @description: 设置共享持久化处理
  /// @param {*}
  /// @return {*}
  void setPrefs(SharedPreferences instance, String customPrefix) {
    AppSharePreferences.shared.setPrefs(instance, customPrefix);
  }

  /// 设置请求头
  void setHeader(Map<String, dynamic> parameters) {
    if (parameters == null) {
      parameters = {
        'platform': Platform.isIOS ? 'ios' : 'android',
        'appName': AppInfo.instance.appName(),
        'appVersion': AppInfo.instance.appVersion()
      };
    }
    Api.instance.httpBaseHeaders = parameters;
  }
}
