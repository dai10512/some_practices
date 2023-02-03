import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_free_image/retrofit_pokemon/viewModel/pokemon_page_model.dart';

import '../repository/pokemon_repository.dart';

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonPageModelProvider.notifier).fetch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageModelNotifier = ref.read(pokemonPageModelProvider.notifier);
    final textController = pageModelNotifier.textController;
    final asyncPokemon = ref.watch(pokemonPageModelProvider).pokemonState;

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
      body: Consumer(builder: (context, ref, _) {
        return asyncPokemon.when(
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
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageModelNotifier.onFieldSubmitted();
        },
      ),
    );
  }
}
