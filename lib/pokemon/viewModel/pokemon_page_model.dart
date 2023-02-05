import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/pokemon_repository.dart';

part 'pokemon_page_model.freezed.dart';

@freezed
class PokemonPageModelState with _$PokemonPageModelState {
  factory PokemonPageModelState(
    Ref<Object?> ref, {
    @Default(1) int count,
    @Default(AsyncValue.loading()) AsyncValue pokemonState,
  }) = _PokemonPageModelState;
}

// 型必須なので注意
final pokemonPageModelProvider =
    NotifierProvider<PokemonPageModel, PokemonPageModelState>(
        () => PokemonPageModel());

class PokemonPageModel extends Notifier<PokemonPageModelState> {
  @override
  build() => PokemonPageModelState(ref);

  final textController = TextEditingController(text: 'ground');
  String get text => textController.text;

  // 2回目のfetchはinvalidateを使うべきと思われる。
  void fetch() async {
    state = state.copyWith(pokemonState: const AsyncValue.loading());
    final data = ref.watch(repositoryProvider).getNamesWithType(text);
    final pokemonState = await AsyncValue.guard(() async => data);
    state = state.copyWith(pokemonState: pokemonState);
  }
}
