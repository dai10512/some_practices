import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client/pokemon_api_client.dart';

final repositoryProvider = Provider((ref) => PokemonRepository());
final FutureProviderFamily<List, String> pokemonsGetNamesWithTypeProvider =
    FutureProvider.family(
  (Ref ref, String type) async {
    final data = ref.read(repositoryProvider).getNamesWithType(type);
    return data;
    // .then((value) => print(value));
  },
);

class PokemonRepository {
  var dio = Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'common-header': 'xx',
      },
    ),
  );

  Future<List> getNamesWithType(String type) async {
    final client = RestClient(dio);
    return await client
        .getNamesWithType(type)
        .then((value) => value.pokemon ?? []);
  }

  Future<List> getNamesWithType2(String type) async {
    final client = RestClient(dio);
    return await client
        .getNamesWithType(type)
        .then((value) => value.pokemon ?? []);
  }
}
