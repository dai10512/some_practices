import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => Repository());

class Repository {
  Repository();

  Future<String> getText() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'riverpod test';
  }
}
