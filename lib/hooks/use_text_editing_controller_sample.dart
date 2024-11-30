import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseTextEditingControllerSample extends HookWidget {
  const UseTextEditingControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final displayedText = useState<String>('');

    void onDisplayPressed() {
      displayedText.value = textController.text;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('テキスト表示サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'テキストを入力',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onDisplayPressed,
              child: const Text('表示'),
            ),
            const SizedBox(height: 20),
            Text(
              displayedText.value.isEmpty
                  ? 'ここに入力内容が表示されます'
                  : displayedText.value,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}