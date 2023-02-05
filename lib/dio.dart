import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'common-header': 'xx',
      },
    ),
  ),
);