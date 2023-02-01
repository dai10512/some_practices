import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../client/dio.dart';
import '../client/pokemon_api_client.dart';
import '../model/typePokemon.dart';

final pokemonRefreshProvider = FutureProvider((ref) => pokemonFetchProvider);

final pokemonFetchProvider = FutureProvider.family(
  (ref, String type) async {
    final dio = customDio();
    final client = RestClient(dio);
    dio.options.headers["Demo-Header"] = "demo header"; //なくてもOKでした。

    try {
      final pokeType = await client.getNamesWithType(type).then(
        (it) {
          logger.i(it);
          return it;
        },
      );

      final List<TypePokemon>? typePokemons = pokeType.pokemon;
      print(typePokemons.toString());
      return typePokemons ?? [];
    } catch (e) {
      if (e.hashCode == 404) {
        return [];
      }
    }
    return [];
  },
);

final aaProvider = FutureProvider.family((
  String type,
  RestClient client,
) async {
  final pokemonRepository = PokemonRepository(client);
  pokemonRepository.getNamesWithType(type);
});

class PokemonRepository {
  PokemonRepository(this._client);
  final RestClient _client;

  Future<ApiResponse> getNamesWithType(String type) async {
    return await _client
        .getNamesWithType(type)
        .then((value) => ApiResponse(ApiResponseType.OK, value, ''))
        .catchError(
      (e) {
        // int errorCode = 0;
        // String errorMessage = "";
        switch (e.runtimeType) {
          case DioError:
            // 失敗した応答のエラーコードとメッセージを取得するサンプル
            // ここでエラーコードのハンドリングると良さげ
            final res = (e as DioError).response;
            if (res != null) {
              // errorCode = res.statusCode;
              // errorMessage = res.statusMessage;
            }
            break;
          default:
        }
      },
    );
  }
}

//   // エラーハンドリングについてのretrofit公式ドキュメント
//   // https://pub.dev/documentation/retrofit/latest/
//   int errorCode = 0;
//   String errorMessage = "";
//   switch (e.runtimeType) {
//     case DioError:
//       // 失敗した応答のエラーコードとメッセージを取得するサンプル
//       // ここでエラーコードのハンドリングると良さげ
//       final res = (e as DioError).response;
//       if (res != null) {
//         errorCode = res.statusCode;
//         errorMessage = res.statusMessage;
//       }
//       break;
//     default:
//   }
// ・・・　省略　・
// getNamesWithType(int page, int perPage, String query) async {

// Future<ApiResponse> fetchArticle(int page, int perPage, String query) async {
// return await _client
//     .fetchItems(page, perPage, query)
//     .then((value) => ApiResponse(ApiResponseType.OK, value))
//     .catchError((e) {
//   // エラーハンドリングについてのretrofit公式ドキュメント
//   // https://pub.dev/documentation/retrofit/latest/
//   int errorCode = 0;
//   String errorMessage = "";
//   switch (e.runtimeType) {
//     case DioError:
//       // 失敗した応答のエラーコードとメッセージを取得するサンプル
//       // ここでエラーコードのハンドリングると良さげ
//       final res = (e as DioError).response;
//       if (res != null) {
//         errorCode = res.statusCode;
//         errorMessage = res.statusMessage;
//       }
//       break;
//     default:
//   }
// ・・・　省略　・・・

// 共通のレスポンスクラスとして定義
// resultはdynamicにしとく。（使う側でcastする）
class ApiResponse {
  final ApiResponseType apiStatus;
  final dynamic result;
  final String customMessage;

  ApiResponse(this.apiStatus, this.result, this.customMessage);
}

// ここは必要に応じて定義
enum ApiResponseType {
  OK,
  BadRequest,
  Forbidden,
  NotFound,
  MethodNotAllowed,
  Conflict,
  InternalServerError,
  Other,
}

// class PokemonService {
//   PokemonService(this.ref) : super();

//   final Ref ref;
//   get _dio => ref.read(dioProvider);

//   final client = RestClient(_dio);

//   fetchPokemon(
//     Ref ref,
//     String type,
//   ) async {
//     try {
//       final pokeType = await client.getNamesWithType(type).then((it) {
//         logger.i(it);
//         return it;
//       });
//       final typePokemons = pokeType.pokemon;
//       return typePokemons ?? [];
//     } catch (e) {
//       if (e.hashCode == 404) {
//         return [];
//       }
//     }
//     return [];
//   }

//   fetchPokemon2(
//     Ref ref,
//     String type,
//     RestClient client,
//   ) async {
//     try {
//       final pokeType = await client.getNamesWithType(type).then((it) {
//         logger.i(it);
//         return it;
//       });
//       final typePokemons = pokeType.pokemon;
//       return typePokemons ?? [];
//     } catch (e) {
//       if (e.hashCode == 404) {
//         return [];
//       }
//     }
//     return [];
//   }
// }
