import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:search_free_image/retrofit_pokemon/client/client.dart';
import 'package:share_plus/share_plus.dart';

// part 'pixabay_page_view_model.g.dart';

final imageRefreshProvider =
    FutureProvider<dynamic>((ref) => imageFetchProvider);

final imageFetchProvider = FutureProvider.family((ref, text) async {
  const pixabayKey = '32493323-0db8d050baa6e6cc76d89fb4b';
  const perPage = 100;
  var options = BaseOptions(
    baseUrl: 'https://pixabay.com/api',
    connectTimeout: 50000,
    receiveTimeout: 30000,
  );
  final dio = Dio(options);  // dio.options.headers["Demo-Header"] =
  //     "demo header"; // config your dio headers globally
  final logger = Logger();
  final client = RestClient(dio);
  client.getNamesWithType('').then((it) => logger.i(it));

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

// @RestApi(baseUrl: 'https://pixabay.com/api')
// abstract class RestClient {
//   factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

//   @GET("")
//   Future<List<Task>> getTasks();

//   @GET("/tasks/{id}")
//   Future<Task> getTask(@Path("id") String id);

//   @GET('/demo')
//   Future<String> queries(@Queries() Map<String, dynamic> queries);

//   getNamesWithType(String type) {}
// }

// @JsonSerializable()
// class Task {
//   String? id;
//   String? name;
//   String? avatar;
//   String? createdAt;

//   Task({this.id, this.name, this.avatar, this.createdAt});

//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
//   Map<String, dynamic> toJson() => _$TaskToJson(this);
// }
