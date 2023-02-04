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

// class PokemonPageModel extends Notifier<PokemonPageModelState> {
//   @override
//   build() => PokemonPageModelState(ref);

//   final textController = TextEditingController(text: 'ground');

//   void fetch() {
//     // try {
//     //   final data =
//     //       ref.watch(pokemonGetNamesWithTypeProvider(textController.text));
//     //   state = state.copyWith(pokemonState: AsyncData(data));
//     // } catch (error, stackTrace) {
//     //   state = state.copyWith(pokemonState: AsyncValue.error(error, stackTrace));
//     // }
//   }

//   void onFieldSubmitted() {
//     ref.invalidateSelf();

//     ref.invalidate(pokemonsGetNamesWithTypeProvider);
//   }
// }

// 型必須
final pokemonPageModelProvider =
    NotifierProvider<PokemonPageModel, PokemonPageModelState>(
        () => PokemonPageModel());

// class PokemonPageModel extends Notifier<AsyncValue<List>> {
//   @override
//   build() => const AsyncValue.loading();

class PokemonPageModel extends Notifier<PokemonPageModelState> {
  @override
  build() => PokemonPageModelState(ref);

  final textController = TextEditingController(text: 'ground');
  String get text => textController.text;

  void fetch() async {
    state = state.copyWith(pokemonState: const AsyncValue.loading());
    final data = ref.watch(pokemonsGetNamesWithTypeProvider(text).future);
        // state = state.copyWith(pokemonState :await AsyncValue.guard(() async => data));

    final pokemonState = await AsyncValue.guard(() async => data);
    state = state.copyWith(pokemonState: pokemonState);
  }
}
