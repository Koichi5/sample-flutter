import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stream_screen_controller.g.dart';

@riverpod
Stream<String> streamScreenController(StreamScreenControllerRef ref) async* {
  for (var i = 0; i < 10; i++) {
    const url = 'https://random-word-api.herokuapp.com/word';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final output = jsonResponse[0] as String;
      yield output;
    }
  }
}
