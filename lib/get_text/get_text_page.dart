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
    //stateは描画後にコールバックする
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonPageModelProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(pokemonPageModelProvider).textState;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('aa'),
      ),
      body: asyncValue.when(
        error: (_, stackTrace) => const Center(child: Text('error')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) => Center(child: Text(data)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(pokemonPageModelProvider.notifier).fetch();
        },
      ),
    );
  }
}
