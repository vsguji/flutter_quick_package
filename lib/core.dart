/*
 * @Author: qian suo
 * @Date: 2021-11-30 13:44:58
 * @LastEditTime: 2022-02-19 14:31:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /flutter_quick_package/lib/core.dart
 */
/// 请求接口
export 'core/api/api.dart';
//
export 'core/base/request.dart';
//
export 'core/base/response_model.dart';
//
export 'core/base/app_config.dart';
//
export 'core/base/app_model.dart';
//
export 'core/base/app_share_preferences.dart';
//
export 'core/base/constants.dart';
//

/// 映射
export 'core/model/reflectable.dart';

// 数据模型
export 'core/model/base_model.dart';

// 工具类
export 'core/utils/dart_helper.dart';

// 状态码
export 'core/api/status_code.dart';

// 注:反射必须添加
// reflectable: ^3.0.1 # 反射
//   build_runner: any
//   built_value_generator: any