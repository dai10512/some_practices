import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:search_free_image/free_images/view/pixabay_page.dart';
import 'package:search_free_image/retrofit_pokemon/view/pokemon_page.dart';

final logger = Logger();
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
      home: PokemonPage(),
      // home: PixabayPage(),
    );
  }
}
