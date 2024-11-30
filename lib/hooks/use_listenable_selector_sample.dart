import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseListenableSelectorSample extends HookWidget {
  const UseListenableSelectorSample({super.key});

  /// メールアドレスのバリデーション関数
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
        r"[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isValid = useListenableSelector(
      textController,
      () => isValidEmail(textController.text),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useListenableSelector サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'メールアドレス',
                labelStyle: TextStyle(
                  color: isValid
                      ? Theme.of(context).colorScheme.primary
                      : Colors.red,
                ),
                border: const OutlineInputBorder(),
                errorText: isValid ? null : '有効なメールアドレスを入力してください',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isValid
                        ? Theme.of(context).colorScheme.primary
                        : Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isValid ? Colors.grey : Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textController.clear();
        },
        tooltip: '入力をクリア',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
