import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModel/pokemon_page_model.dart';

class PokemonPage extends ConsumerWidget {
  const PokemonPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeApi"),
      ),
      body: asyncValue.when(
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
