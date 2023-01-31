import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/pokemon_service.dart';

part 'pokemon_page_model.freezed.dart';

final pokemonPageModelProvider = NotifierProvider(() => PokemonPageModel());

@freezed
class PokemonPageModelState with _$PokemonPageModelState {
  factory PokemonPageModelState(
    Ref<Object?> ref, {
    @Default(-1) count,
  }) = _PokemonPageModelState;
}

class PokemonPageModel extends Notifier<PokemonPageModelState> {
  @override
  build() => PokemonPageModelState(ref);
  AsyncValue get asyncPokemon => ref.watch(pokemonProvider);
}

