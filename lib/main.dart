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

  final textController = TextEditingController(text: 'kabuki');

  @override
  Widget build(context, ref) {
    final asyncImage = ref.watch(imageProvider(textController.text));
    final asyncDate = ref.watch(oneProvider);

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
              },
            );
          },
        ),
      ),
      body: Column(
        children: [
          asyncImage.when(
            error: (error, stackTrace) => const Text('error'),
            loading: () => const Text('loading'),
            data: (data) => Text(data.toString()),
            // data: (data) => _gridView(data),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          // 状態を更新する
          print('click!!!!!!!!!!!!!!!!!!!!!!!!');
          ref.refresh(oneProvider);
          // ref.refresh(oneProvider);
          // ref.invalidate(imageProvider('sushi'));
          // ref.invalidate;
          // ref.invalidate(oneProvider);

          // await ref.read(imageProvider('sushi').future);
        },
      ),
    );
  }

  Widget _gridView(List data) {
    final images = data.map((e) {
      final pixabayImage = PixabayImage.fromMap(e);
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
    }).toList();

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: images,
    );
  }

  final dateProvider = FutureProvider<dynamic>((ref) async {
    // await Future.delayed(const Duration(seconds: 3));
    return DateTime.now();
  });
}
