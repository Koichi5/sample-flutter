import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gemini_provider.g.dart';

@riverpod
class GeminiController extends _$GeminiController {
  @override
  void build() {}

  GenerativeModel loadModel() {
    var apiKey = dotenv.get('API_KEY');
    return GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  }
}
