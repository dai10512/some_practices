import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client/client.dart';
import '../client/dio.dart';
import '../model/pokeType.dart';
import '../model/typePokemon.dart';

final pokemonProvider = FutureProvider<dynamic>(
  (ref) async {
    var type = "ground"; //じめんタイプを指定。ここを変えれば他のタイプに。

    final dio = customDio();
    final client = RestClient(dio);
    dio.options.headers["Demo-Header"] = "demo header"; //なくてもOKでした。
    final PokeType pokeType = await client.getNamesWithType(type);
    final List<TypePokemon>? typePokemons = pokeType.pokemon;
    print(typePokemons.toString());
    return typePokemons;
  },
);
