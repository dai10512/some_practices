import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'get_text_repository.dart';

part 'get_text_page_model.freezed.dart';

// 型必須なので注意
final getTextPageModelProvider =
    NotifierProvider<GetTextPageModel, GetTextPageModelState>(
        () => GetTextPageModel());

@freezed
class GetTextPageModelState with _$GetTextPageModelState {
  factory GetTextPageModelState(
    Ref<Object?> ref, {
    @Default(AsyncValue.loading()) AsyncValue textState,
    //他にもページに必要な変数を適宜追加する
  }) = _GetTextPageModelState;
}

class GetTextPageModel extends Notifier<GetTextPageModelState> {
  @override
  build() => GetTextPageModelState(ref);

  // 2回目のfetchはinvalidateを使うべきと思われる。
  void fetch() async {
    state = state.copyWith(textState: const AsyncValue.loading());
    final Future<String> data = ref.watch(repositoryProvider).getText();
    final AsyncValue<String> textState =
        await AsyncValue.guard(() async => data);
    state = state.copyWith(textState: textState);
  }
}
