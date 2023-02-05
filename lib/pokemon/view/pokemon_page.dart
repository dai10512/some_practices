import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewModel/pokemon_page_model.dart';

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  @override
  void initState() {
    super.initState();
    //stateは描画後にコールバックする
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonPageModelProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageModelNotifier = ref.read(pokemonPageModelProvider.notifier);
    final textController = pageModelNotifier.textController;
    final asyncPokemon = ref.watch(pokemonPageModelProvider).pokemonState;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          controller: textController,
          onFieldSubmitted: (_) => pageModelNotifier.fetch(),
        ),
      ),
      body: asyncPokemon.when(
        error: (_, stackTrace) => const Center(child: Text('error')),
        loading: () => const Center(child: CircularProgressIndicator()),
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
