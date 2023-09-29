import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_notifier_screen_controller.g.dart';

@riverpod
class AsyncNotifierScreenController extends _$AsyncNotifierScreenController {
  @override
  FutureOr<String> build() async {
    const url = 'https://random-word-api.herokuapp.com/word';
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final randomWord = jsonResponse[0];
      return randomWord;
    }
    return '';
  }

  Future<String> getNewWord() async {
    const url = 'https://random-word-api.herokuapp.com/word';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final randomWord = jsonResponse[0];
      return randomWord;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    return 'ERROR';
  }

  Future<void> setNewWord() async {
    state = const AsyncLoading();
    state = AsyncValue.data(await getNewWord());
  }

  void deleteWord() {
    state = const AsyncValue.data('');
  }
}
