import 'package:dio/dio.dart';

Dio customDio() {
  var options = BaseOptions(
    // baseUrl: 'https://pixabay.com/api',
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  return Dio(options);
}
