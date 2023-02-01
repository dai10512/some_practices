import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/pokemon_repository.dart';

class PokemonPage extends ConsumerWidget {
  PokemonPage({super.key});
  final textController = TextEditingController(text: 'ground');

  @override
  Widget build(context, ref) {
    final asyncPokemon = ref.watch(pokemonFetchProvider(textController.text));
    ref.watch(pokemonRefreshProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          controller: textController,
          onFieldSubmitted: (_) async {
            ref.invalidate(pokemonRefreshProvider);
          },
        ),
      ),
      body: asyncPokemon.when(
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
