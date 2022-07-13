import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 200;
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("REQUEST --> ${options.method} ${options.path}");
    logger.i("Content type: ${options.contentType}");
    logger.i("<-- END HTTP");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        "RESPONSE <-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    // logger.i(response.data);
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        logger.i(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      logger.i(response.data);
    }
    logger.i("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e("<-- Error -->");
    logger.e(err.error, err.message);
    return super.onError(err, handler);
  }
}
