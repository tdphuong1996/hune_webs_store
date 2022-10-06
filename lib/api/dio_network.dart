import 'dart:io';

import 'package:dio/dio.dart';

import 'service_constants.dart';
class DioNetwork {
  Dio getDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ServiceConstants.baseUrl,
      contentType: NetworkRequestValues.contentType,
      sendTimeout: ServiceConstants.timeOut,
      connectTimeout: ServiceConstants.timeOut,
      receiveTimeout: ServiceConstants.timeOut,
    );
    dio.interceptors.add(_addInterceptor());
    return dio;
  }

  InterceptorsWrapper _addInterceptor() {
    return InterceptorsWrapper(onRequest: (_option, _handler) {

      _handler.next(_option);
    }, onResponse: (_response, _handler) {

      _handler.next(_response);
    }, onError: (_error, _handler) {
      _handler.next(_error);
    });
  }
}
