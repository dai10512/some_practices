import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'get_text_repository.dart';

part 'get_text_page_model.freezed.dart';

@freezed
class GetTextPageModelState with _$GetTextPageModelState {
  factory GetTextPageModelState(
    Ref<Object?> ref, {
    @Default(AsyncValue.loading()) AsyncValue textState,
  }) = _GetTextPageModelState;
}

// 型必須なので注意
final pokemonPageModelProvider =
    NotifierProvider<PokemonPageModel, GetTextPageModelState>(
        () => PokemonPageModel());

class PokemonPageModel extends Notifier<GetTextPageModelState> {
  @override
  build() => GetTextPageModelState(ref);

  // 2回目のfetchはinvalidateを使うべきと思われる。
  void fetch() async {
    // state = state.copyWith(textState: const AsyncValue.loading());
    final data = ref.watch(repositoryProvider).getText();
    final textState = await AsyncValue.guard(() async => data);
    // state = state.copyWith(textState: textState);
  }
}
