import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_free_image/retrofit_pokemon/model/typePokemon.dart';

// import '../client.dart';
import '../client/client.dart';
import '../model/pokeType.dart';

class PokemonPage extends ConsumerWidget {
  PokemonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeApi"),
      ),
      body: ref.watch(pokemonProvider).when(
            error: (_, stackTrace) => const Text('error'),
            loading: () => const Text('loading..'),
            data: (typePokemons) => ListView.builder(
              itemCount: typePokemons.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(typePokemons[index].pokemon.name));
              },
            ),
          ),
    );
  }
}
