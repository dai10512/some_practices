import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client/client.dart';
import '../model/pokeType.dart';
import '../model/typePokemon.dart';

class TodosNotifier extends StateNotifier {
  // We initialize the list of todos to an empty list
  TodosNotifier(): super([]);
  

  // Let's allow removing todos
  void removeTodo(String todoId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }


final pokemonProvider = FutureProvider<dynamic>(
  (ref) async {
    var type = "ground"; //じめんタイプを指定。ここを変えれば他のタイプに。
    var options = BaseOptions(
      baseUrl: 'https://pixabay.com/api',
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    final dio = Dio(options);
    final client = RestClient(dio);
    dio.options.headers["Demo-Header"] = "demo header"; //なくてもOKでした。
    final PokeType pokeType = await client.getNamesWithType(type);
    final List<TypePokemon>? typePokemons = pokeType.pokemon;
    return typePokemons;
  },
);
