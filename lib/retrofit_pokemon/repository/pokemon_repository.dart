import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../client/client.dart';
import '../client/dio.dart';
import '../model/typePokemon.dart';

final pokemonRefreshProvider =
    FutureProvider<dynamic>((ref) => pokemonFetchProvider);

final pokemonFetchProvider = FutureProvider.family(
  (ref, String text) async {
    var type = text; //じめんタイプを指定。ここを変えれば他のタイプに。

    final dio = customDio();
    final client = RestClient(dio);
    dio.options.headers["Demo-Header"] = "demo header"; //なくてもOKでした。
    try {
      final pokeType = await client.getNamesWithType(type).then(
        (it) {
          logger.i(it);
          return it;
        },
      );

      final List<TypePokemon>? typePokemons = pokeType.pokemon;
      print(typePokemons.toString());
      return typePokemons ?? [];
    } catch (e) {
      if (e.hashCode == 404) {
        return [];
      }
    }
    return [];
  },
);
