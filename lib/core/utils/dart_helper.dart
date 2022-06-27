/*
 * @Author: qian suo
 * @Date: 2021-06-15 11:11:34
 * @LastEditTime: 2021-11-30 14:01:49
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /SRetailGoods/lib/src/utils/dart_check.dart
 */
class DartHelper {
  static bool isNullOrEmpty(String value) => value == '' || value == null;

  static bool isNullOrEmptyList(List value) => value == null || value.isEmpty;
}
