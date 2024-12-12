import 'package:flutter/material.dart';

class SpacingScreen extends StatelessWidget {
  const SpacingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spacing Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // spacing: 16,
          children: [
            const _CustomTextField(
              hintText: 'メールアドレス',
            ),
            const SizedBox(height: 16),
            const _CustomTextField(
              hintText: 'パスワード',
            ),
            const SizedBox(height: 16),
            const _CustomTextField(

              hintText: 'パスワード（確認）',
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('登録')),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(

        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
