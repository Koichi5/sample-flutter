import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ClipboardSample extends HookWidget {
  const ClipboardSample({super.key});

  @override
  Widget build(BuildContext context) {
    final copySourceController = useTextEditingController();
    final pasteTargetController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clipboard Sample'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: copySourceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () =>
                        _copyToClipboard(text: copySourceController.text),
                    child: const Text('Copy'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: pasteTargetController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () async => await _pasteFromClipboard(
                      onPaste: (text) => pasteTargetController.text = text,
                    ),
                    child: const Text('Paste'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyToClipboard({required String text}) {
    Clipboard.setData(ClipboardData(text: text));
  }

  Future<void> _pasteFromClipboard({
    required Function(String) onPaste,
  }) async {
    final data = await Clipboard.getData('text/plain');
    if (data != null) {
      onPaste(data.text ?? '');
    }
  }
}
