/*
 * @Author: qian suo
 * @Date: 2020-12-29 18:17:52
 * @LastEditTime: 2022-05-30 17:31:47
 * @LastEditors: Please set LastEditors
 * @Description: 公共解析处理
 * @FilePath: /SRetailGoods/lib/src/core/base/response_model.dart
 */

import '../api/status_code.dart';

class ResponseModel<T> {
  final int statusCode;
  final String message;
  final T result;
  ResponseModel({this.message, this.result, this.statusCode});
  bool get success => [kCode200, kCode201].contains(statusCode);
}
