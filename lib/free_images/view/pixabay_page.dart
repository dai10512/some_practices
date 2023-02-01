// // import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/pixabay_image.dart';
import '../viewModel/pixabay_page_view_model.dart';

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
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          controller: textController,
          onChanged: (_) async {
            ref.invalidate(imageRefreshProvider);
          },
        ),
      ),
      body: asyncImage.when(
        error: (_, stackTrace) => const Text('error'),
        loading: () => const Center(child: CircularProgressIndicator()),
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
