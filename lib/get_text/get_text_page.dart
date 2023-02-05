import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_text_page_model.dart';

class GetTextPage extends ConsumerStatefulWidget {
  const GetTextPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetTextPageState();
}

class _GetTextPageState extends ConsumerState<GetTextPage> {
  @override
  void initState() {
    super.initState();

    //stateは描画後にコールバックして更新する
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getTextPageModelProvider.notifier).fetch();
    });
  }

  @override
  Widget build(context) {
    final asyncValue = ref.watch(getTextPageModelProvider).textState;

    return Scaffold(
      appBar: AppBar(
        title: const Text('get text page'),
      ),
      body: asyncValue.when(
        error: (_, stackTrace) => const Center(child: Text('error')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) => Center(child: Text(data)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(getTextPageModelProvider.notifier).fetch();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
