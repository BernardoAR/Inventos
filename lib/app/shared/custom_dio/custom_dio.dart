import 'package:dio/dio.dart';
import 'package:inventos/app/shared/constants/constants.dart';
import 'package:inventos/app/shared/custom_dio/interceptors.dart';

class CustomDio {
  final Dio client;
  CustomDio(this.client) {
    client.options.baseUrl = baseUrl;
    client.interceptors.add(CustomInterceptor());
    client.options.connectTimeout = 5000;
  }
}
