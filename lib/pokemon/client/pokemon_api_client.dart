import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/pokeType.dart';

part 'pokemon_api_client.g.dart';


final clientProvider = Provider((ref) => RestClient(Dio()));

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/type/{type}")
  Future<PokeType> getNamesWithType(@Path("type") String type);
}
