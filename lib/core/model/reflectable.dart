/*
 * @Author: qian suo
 * @Date: 2021-11-29 16:48:47
 * @LastEditTime: 2021-12-02 16:57:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /flutter_quick_project/lib/reflectable.dart
 */
import 'package:reflectable/reflectable.dart';

//
class CustomReflectable extends Reflectable {
  const CustomReflectable()
      : super(
          typingCapability,
          invokingCapability,
          superclassQuantifyCapability,
          subtypeQuantifyCapability,
          typeAnnotationQuantifyCapability,
          reflectedTypeCapability,
        );
}

//
const myReflectable = CustomReflectable();
