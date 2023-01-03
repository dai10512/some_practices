import 'package:flutter/material.dart';

import 'main_model.dart';
import 'pixabay_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({Key? key}) : super(key: key);

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List imageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (text) async {
            print(text);
            imageList = await fetchImages(text);
            setState(() {});
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          final image = imageList[index];
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
                      child: Text(
                          ' 👍${pixabayImage.likes.toString()} ')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
