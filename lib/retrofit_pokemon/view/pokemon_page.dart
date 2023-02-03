import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_free_image/retrofit_pokemon/viewModel/pokemon_page_model.dart';

import '../repository/pokemon_repository.dart';

class PokemonPage extends ConsumerWidget {
  const PokemonPage({super.key});

  @override
  Widget build(context, ref) {
    final pageModelNotifier = ref.read(pokemonPageModelProvider.notifier);
    final textController = pageModelNotifier.textController;
    final pokemonProvider = pageModelNotifier.getProvider();
    final asyncPokemon = ref.watch(pokemonProvider);
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
          onFieldSubmitted: (_) {
            pageModelNotifier.onFieldSubmitted();
          },
        ),
      ),
      body: asyncPokemon.when(
        error: (_, stackTrace) => const Text('error'),
        loading: () => const Text('loading..'),
        data: (typePokemons) => ListView.builder(
          itemCount: typePokemons.length,
          itemBuilder: (context, index) {
            final typePokemon = typePokemons[index];
            return ListTile(
              title: Text(typePokemon.pokemon.name),
            );
          },
        ),
      ),
    );
  }
  
}
