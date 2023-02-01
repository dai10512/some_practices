import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/pokeType.dart';

part 'pokemon_api_client.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/type/{type}")
  Future<PokeType> getNamesWithType(@Path("type") String type);
}

  // var options = BaseOptions(
  //   baseUrl: 'https://pixabay.com/api',
  //   connectTimeout: 50000,
  //   receiveTimeout: 30000,
  // );