/*
 * @Author: qian suo
 * @Date: 2021-09-18 16:08:56
 * @LastEditTime: 2022-02-18 10:21:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /sr_subscribe/lib/src/core/model/BaseModel.dart
 */
import 'package:flutter_quick_package/core/model/reflectable.dart';

/// 基础数据模型
///

@myReflectable
class BaseModel {
  BaseModel();
  int code;
  String msg;
  Object response;

  void initFromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    response = jsonRes['data'];
  }

  BaseModel.fromJson(json) {
    initFromJson(json);
  }
  static BaseModel returnModel(Map parameter) => BaseModel.fromJson(parameter);
}

@myReflectable
abstract class page {
  static page parameter(Map<String, dynamic> map) {}
}

abstract class PageBaseModel<T> extends BaseModel {
  int current;
  int pages;
  int size;
  int total;
  List<T> records;

  PageBaseModel(
      {this.current, this.pages, this.size, this.total, this.records});
}
