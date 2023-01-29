import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_model.dart';
import 'pixabay_image.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PixabayPage(),
      // home: HomePage(),
    );
  }
}

class PixabayPage extends ConsumerWidget {
  PixabayPage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(context, ref) {
    final asyncValue = ref.watch(futureProvider(textController.text));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Consumer(
          builder: (context, ref, _) {
            return TextFormField(
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
              ),
              controller: textController,
              onFieldSubmitted: (text) async {
                print('submitt!!!!!!!!!!!!!!!');
                ref.refresh(futureProvider(text));
                ref.refresh(futureProvider(textController.text));
              },
            );
          },
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          return asyncValue.when(
            error: (error, stackTrace) => const Text('error'),
            loading: () => const Text('loading'),
            data: (data) => _gridView(data),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          // 状態を更新する
          print('click!!!!!!!!!!!!!!!!!!!!!!!!');
          ref.read(futureProvider(textController.text));
          ref.refresh(futureProvider(textController.text));
        },
      ),
    );
  }

  Widget _gridView(List data) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final image = data[index];
        final pixabayImage = PixabayImage.fromMap(image);
        return InkWell(
          onTap: () async {
            shareImage(pixabayImage.webformatURL.toString());
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                pixabayImage.previewURL.toString(),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    color: Colors.white,
                    child: Text(' 👍${pixabayImage.likes.toString()} ')),
              ),
            ],
          ),
        );
      },
    );
  }
}

// FutureProviderの作成 (単一のデータを非同期で取得する)
final futureProvider1 = FutureProvider<dynamic>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 'Hello World';
});

// FutureProviderを作成すると「AsyncValue」オブジェクトを生成できる
//「AsyncValue」は非同期通信の通信中、通信終了、異常終了処理をハンドリングしてくれるRiverpodの便利な機能のこと

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValueオブジェクトを取得する
    final asyncValue = ref.watch(futureProvider1);
    return Scaffold(
      appBar: AppBar(title: const Text('Hallo World')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          // 状態を更新する
          ref.refresh(futureProvider1);
        },
      ),
      body: Center(
        child: asyncValue.when(
          error: (err, _) => Text(err.toString()), //エラー時
          loading: () => const CircularProgressIndicator(), //読み込み時
          data: (data) => Text(data.toString()), //データ受け取り時
        ),
      ),
    );
  }
}
