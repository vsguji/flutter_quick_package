/*
 * @Author: qian suo
 * @Date: 2020-12-29 18:17:52
 * @LastEditTime: 2021-11-30 14:01:33
 * @LastEditors: Please set LastEditors
 * @Description: 模型转换工厂
 * @FilePath: /SRetailGoods/lib/src/core/model/model_factory.dart
 */
import 'package:flutter_quick_package/core/model/base_model.dart';
import 'package:flutter_quick_package/core/model/reflectable.dart';
import 'package:reflectable/reflectable.dart';

class ModelFactory {
  static T generate<T>(json) {
    var canReflect = myReflectable.canReflect(T);
    if (!canReflect) {
      throw NoSuchCapabilityError(
          "Reflecting on type `$T` without capability'");
    }
    var classMirror = myReflectable.reflectType(T) as ClassMirror;
    BaseModel model = classMirror.invoke('returnModel', [json]);
    return model as T;
  }
}
