import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_flutter/gemini/providers/gemini_provider.dart';

part 'chat_provider.g.dart';

@Riverpod(dependencies: [GeminiController])
class ChatController extends _$ChatController {
  late final ChatSession chat;
  static const gemini = types.User(id: 'gemini');
  static const me = types.User(id: 'me');

  @override
  List<types.Message> build() {
    final model = ref.read(geminiControllerProvider.notifier).loadModel();
    chat = model.startChat();
    return [];
  }

  void addMessage({required types.User author, required String text}) {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final message =
        types.TextMessage(author: author, id: timeStamp, text: text);
    state = [message, ...state];
  }

  Future<void> ask({required String question}) async {
    final content = Content.text(question);
    try {
      addMessage(author: me, text: question);
      final response = await chat.sendMessage(content);
      final message = response.text ?? 'Retry later';
      addMessage(author: gemini, text: message);
    } on Exception {
      addMessage(author: gemini, text: 'Retry later');
    }
  }
}
