/*
 * @Author: qian suo
 * @Date: 2020-12-29 18:17:52
 * @LastEditTime: 2022-05-30 17:16:44
 * @LastEditors: Please set LastEditors
 * @Description: 网络业务集合接口
 * @FilePath: /SRetailGoods/lib/src/core/api/api.dart
 */
import 'package:flutter_quick_package/core/base/app_config.dart';
import 'package:flutter_quick_package/core/base/response_model.dart';
import 'package:flutter_quick_package/core/utils/dart_helper.dart';
import '../base/request.dart';

class Api {
  Api._();
  // 单例
  static final Api _instance = Api._();
  static Api get instance => _instance;
  //
  Map<String, Object> _headers;
  set httpBaseHeaders(Map<String, Object> parameter) => _headers = parameter;
  Map<String, Object> get baseHeaders => _headers;
  //
  final Request _http = Request(AppConfig.instance.apiHost);

  /// 基础请求
  Future<ResponseModel<BaseModel>> requestNetWork<BaseModel>(
      {String url = "",
      String method = "GET",
      bool needHud = true,
      dynamic parameters = const {"": Object},
      Map<String, Object> headers = const {}}) {
    assert(!DartHelper.isNullOrEmpty(url), "== 请求 url 不能为空 ==");
    assert(!DartHelper.isNullOrEmpty(method), "== 请求 method 不能为空");
    baseHeaders.forEach((key, value) {
      headers.putIfAbsent(key, () => value);
    });
    var r;
    switch (method) {
      case "GET":
      case "DELETE":
        r = _http.request<BaseModel>(url,
            method: method,
            queryParameters: parameters,
            needHud: needHud,
            headers: headers);
        break;
      case "POST":
      case "PUT":
        r = _http.request<BaseModel>(url,
            method: method,
            data: parameters,
            needHud: needHud,
            headers: headers);
        break;
        break;
      default:
    }
    return r;
  }

  /// 分页请求
  Future<ResponseModel<BaseModel>> requestNetWorkByPage<BaseModel>(
      {int page = 1,
      int size = 10,
      String url,
      String method = "GET",
      bool needHud = true,
      Map<String, dynamic> parameters,
      Map<String, Object> header}) {
    if (parameters == null) {
      parameters = {"current": page, "size": size};
    } else {
      parameters["current"] = page;
      parameters["size"] = size;
    }
    return requestNetWork(
        url: url,
        method: method,
        parameters: parameters,
        needHud: needHud,
        headers: header);
  }
}
