import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'main_model.dart';

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
          return InkWell(
            onTap: () async {
              onTap(image['webformatURL']);
              // print(image['likes']);
              // Directory dir = await getTemporaryDirectory();
              // Response response = await Dio().get(
              //   image['webformatURL'],
              //   options: Options(
              //     responseType: ResponseType.bytes,
              //   ),
              // );
              // final imageFile = await File('${dir.path}/image.png')
              //     .writeAsBytes(response.data);
              // await Share.shareXFiles([XFile(imageFile.path)]);
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image['previewURL'],
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      color: Colors.white,
                      child: Text(' 👍${image['likes'].toString()} ')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
