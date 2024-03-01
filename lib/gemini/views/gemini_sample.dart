import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:sample_flutter/gemini/providers/chat_provider.dart';

class GeminiSample extends ConsumerWidget {
  const GeminiSample({super.key});
  static const me = types.User(id: 'me');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatControllerProvider);
    return Scaffold(
      body: Chat(
        user: me,
        messages: messages,
        onSendPressed: (a) {
          ref.read(chatControllerProvider.notifier).ask(question: a.text);
        },
      ),
    );
  }
}
