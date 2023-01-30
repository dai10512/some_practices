import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/pokeType.dart';

part 'client.g.dart';


@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/type/{type}")
  Future<PokeType> getNamesWithType(@Path("type") String type);
}