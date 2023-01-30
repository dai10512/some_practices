import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final imageRefreshProvider = FutureProvider<dynamic>((ref) {
  return imageFetchProvider;
});

final imageFetchProvider = FutureProvider.family((ref, text) async {
  const pixabayKey = '32493323-0db8d050baa6e6cc76d89fb4b';
  const perPage = 100;
  DateTime.now();
  var options = BaseOptions(
    baseUrl: 'https://pixabay.com/api',
    connectTimeout: 50000,
    receiveTimeout: 30000,
  );
  final dio = Dio(options);

  Response response = await dio.get(
    '',
    queryParameters: {
      'key': pixabayKey,
      'q': text,
      'image_type': 'photo',
      'per_page': perPage,
    },
  );
  print(response.data);

  final imageList = await response.data['hits'];
  print(await response.data['hits']);
  await Future.delayed(const Duration(seconds: 3));

  return imageList;
});

Future<void> shareImage(String imagePath) async {
  Directory dir = await getTemporaryDirectory();
  Response response = await Dio().get(
    imagePath,
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );
  final imageFile =
      await File('${dir.path}/image.png').writeAsBytes(response.data);
  await Share.shareXFiles([XFile(imageFile.path)]);
}
