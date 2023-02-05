import 'package:flutter/material.dart';
import 'package:search_free_image/get_text/get_text_page.dart';

import 'pixabay_free_image/view/pixabay_page.dart';
import 'pokemon/view/pokemon_page.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバッグページ'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Column(
            children: [
              NavigationButton(
                label: 'Pixabay free image page\n'
                    'for basic skill',
                page: PixabayPage(),
              ),
              const CommonSpace(),
              const NavigationButton(
                label: 'pokemon page\n'
                    'for architecture and riverpod v2',
                page: PokemonPage(),
              ),
              const CommonSpace(),
              const NavigationButton(
                label: 'get text page\n'
                    'for riverpod v2',
                page: GetTextPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonSpace extends StatelessWidget {
  const CommonSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.label,
    required this.page,
  });

  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
