import 'package:dio/dio.dart';

import '../../exception/logging_interceptor.dart';

class EndpointProvider {
  //Truyền header (token) - mock
  Map<String, dynamic> author = {};

  Dio connectApi() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 5000, connectTimeout: 30000, headers: author);
    final Dio dio = Dio(options);
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }
}