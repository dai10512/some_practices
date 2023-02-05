import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => PokemonRepository(ref));

class PokemonRepository {
  PokemonRepository(this.ref);
  final Ref ref;

  Dio get dio => ref.read(dioProvider);

  Future<String> getText() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'riverpod test';
  }
}

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
