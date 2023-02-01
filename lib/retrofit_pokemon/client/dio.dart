import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => customDio());

Dio customDio() {
  var options = BaseOptions(
    // baseUrl: 'https://pixabay.com/api',
    connectTimeout: 10000,
    receiveTimeout: 10000,
    headers: {"Demo-Header": "demo header"},
  );
  return Dio(options);
}
