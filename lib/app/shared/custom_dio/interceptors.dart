import 'package:dio/dio.dart';

class CustomInterceptor implements InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return options;
  }

  @override
  Future onResponse(Response response) async {
    print('REQUEST[${response.statusCode}] => PATH: ${response.request.path}');
    return response;
  }

  @override
  Future onError(DioError err) async {
    print('ERROR[${err.response.statusCode}] => PATH: ${err.request.path}');
    return err;
  }
}
