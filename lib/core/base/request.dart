/*
 * @Author: qian suo
 * @Date: 2020-12-29 18:17:52
 * @LastEditTime: 2022-05-30 18:25:45
 * @LastEditors: Please set LastEditors
 * @Description: 网络请求
 * @FilePath: /SRetailGoods/lib/src/core/base/request.dart
 */
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_quick_package/core/model/model_factory.dart';
import '../../core.dart';

class Request {
  final String baseurl;
  Dio _dio;
  Request(this.baseurl, {int timeOut = 20}) {
    _dio = Dio(
      BaseOptions(baseUrl: baseurl, sendTimeout: timeOut),
    );
  }

  /// 基础请求
  Future<ResponseModel<T>> request<T>(String url,
      {String method = 'GET',
      dynamic data,
      Map<String, dynamic> queryParameters,
      bool cached = false,
      Map<String, Object> headers,
      Duration maxStale = const Duration(days: 7),
      int cacheToalMaxSize = 10485760,
      int cacheMaxEntrySize = 1048576,
      bool needHud = true}) async {
    try {
      if (cached) {
        MemCacheStore cacheStore = MemCacheStore(
            maxSize: cacheToalMaxSize, maxEntrySize: cacheMaxEntrySize);
        CacheOptions cacheOptions =
            CacheOptions(maxStale: maxStale, store: cacheStore);
        _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
      }
      if (headers != null) _dio.options.headers = headers;
      _dio.options.method = method;
      _dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
      AppConfig app = AppConfig.instance;
      if (needHud) {
        app.loadHudWillCallBack?.call(url);
      }
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (needHud) {
        app.loadHudDidCallBack?.call(url);
      }
      Map responseMap = response.data;
      int code = responseMap["code"];
      if (code != kCode200) {
        String msg = responseMap["msg"];
        app.failCallBack?.call(responseMap, msg); // 全局回调主工程主力
      }
      return ResponseModel<T>(
          statusCode: response.statusCode,
          message: response.statusMessage,
          result: ModelFactory.generate(response.data));
    } on DioError catch (_) {
      // 错误提示框
      Map responseMap = _.response?.data;
      AppConfig app = AppConfig.instance;
      int code = responseMap["code"];
      if (code != kCode200) {
        String msg = responseMap["msg"];
        app.failCallBack?.call(responseMap, msg); // 全局回调主工程主力
      }
      return ResponseModel(
          statusCode: _.response?.statusCode ?? _.type.index,
          message: _.message);
    }
  }

  /// 设置代理
  void setHttpAdapter(String ip, String port) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        // ignore: missing_return
        (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        // return "PROXY 172.50.10.32:8888"; //这里将localhost设置为自己电脑的IP，其他不变，注意上线的时候一定记得把代理去掉
        return 'PROXY' + ' ' + ip + ':' + port;
      };
      // you can also create a HttpClient to dio
      // return HttpClient();
    };
  }

  /// 添加请求监听
  void addInterceptors(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  /// 删除请求监听
  void removeInterceptors(Interceptor interceptor) {
    _dio.interceptors.removeWhere(
        (element) => element.runtimeType == interceptor.runtimeType);
  }
}
