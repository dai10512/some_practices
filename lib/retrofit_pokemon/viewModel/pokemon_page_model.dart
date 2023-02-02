import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/pokemon_repository.dart';

part 'pokemon_page_model.freezed.dart';

final pokemonPageModelProvider =
    NotifierProvider<PokemonPageModel, PokemonPageModelState>(
        () => PokemonPageModel());

@freezed
class PokemonPageModelState with _$PokemonPageModelState {
  factory PokemonPageModelState(
    Ref<Object?> ref, {
    @Default(-1) int count,
    @Default(AsyncValue.loading()) AsyncValue pokemonState,
  }) = _PokemonPageModelState;
}

class PokemonPageModel extends Notifier<PokemonPageModelState> {
  @override
  build() async => PokemonPageModelState(ref);

  final textController = TextEditingController(text: 'ground');

  void onFieldSubmitted() {
    ref.invalidate(pokemonRefreshProvider);
  }
}
