import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/pokemon_service.dart';

part 'pokemon_page_model.freezed.dart';
part 'pokemon_page_model.g.dart';

// final pokemonPageModelProvider =
//     AsyncNotifierProvider<PokemonPageModel, PokemonPageModelState>(
//         () => PokemonPageModel());

@freezed
class PokemonPageModelState with _$PokemonPageModelState {
  factory PokemonPageModelState(
    Ref<Object?> ref, {
    @Default(-1) count,
  }) = _PokemonPageModelState;
}

// class PokemonPageModel extends AsyncNotifier<PokemonPageModelState> {
//   @override
//   build() => PokemonPageModelState(ref);
//   AsyncValue get asyncPokemon => ref.watch(pokemonProvider);
// }

@riverpod
class PokemonPageModel extends _$PokemonPageModel {
  @override
  build() => PokemonPageModelState(ref);
  AsyncValue get asyncPokemon => ref.watch(pokemonProvider);
}