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
    );
  }
}

class PixabayPage extends ConsumerWidget {
  PixabayPage({Key? key}) : super(key: key);

  final textController = TextEditingController(text: 'kabuki');

  @override
  Widget build(context, ref) {
    final asyncImage = ref.watch(imageFetchProvider(textController.text));
    ref.watch(imageRefreshProvider);

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
              onChanged: (_) async {
                ref.invalidate(imageRefreshProvider);
              },
            );
          },
        ),
      ),
      body: asyncImage.when(
        error: (error, stackTrace) => const Text('error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) => _gridViewBuilder(data),
      ),
    );
  }

  Widget _gridViewBuilder(List data) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: data.length,
      itemBuilder: ((context, index) {
        final pixabayImage = PixabayImage.fromMap(data[index]);
        return InkWell(
          onTap: () => shareImage(pixabayImage.webformatURL.toString()),
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
                  child: Text(' 👍${pixabayImage.likes.toString()} '),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
