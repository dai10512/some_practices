import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client/dio.dart';
import '../client/pokemon_api_client.dart';

final pokemonRefreshProvider =
    FutureProvider((ref) => pokemonGetNamesWithTypeProvider);

final pokemonGetNamesWithTypeProvider = FutureProvider.family<List, String>(
    (ref, type) async => PokemonRepository().getNamesWithType(type));

class PokemonRepository {
  Future<List> getNamesWithType(String type) async {
    final dio = customDio();
    final client = RestClient(dio);
    return await client
        .getNamesWithType(type)
        .then((value) => value.pokemon ?? []);
  }

  Future<List> getNamesWithType2(String type) async {
    final dio = customDio();
    final client = RestClient(dio);
    return await client
        .getNamesWithType(type)
        .then((value) => value.pokemon ?? []);
  }
}
