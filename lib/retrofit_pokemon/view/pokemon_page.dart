import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_free_image/retrofit_pokemon/viewModel/pokemon_page_model.dart';

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  @override
  void initState() {
    super.initState();
    //描画後にコールバックする
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonPageModelProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    //確定//
    final pageModelNotifier = ref.read(pokemonPageModelProvider.notifier);
    final textController = pageModelNotifier.textController;
    //確定//

    final asyncPokemon = ref.watch(pokemonPageModelProvider);

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
            pageModelNotifier.fetch();
          },
        ),
      ),
      body: asyncPokemon.when(
        error: (_, stackTrace) => const Text('error'),
        loading: () => const Text('loading..'),
        data: (typePokemons) => ListView.builder(
          itemCount: typePokemons.length,
          // itemCount: 1,
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
