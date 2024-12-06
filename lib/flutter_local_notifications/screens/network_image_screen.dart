import 'package:flutter/material.dart';

class NetworkImageScreen extends StatelessWidget {
  const NetworkImageScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像表示'),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) {
            return const Text('画像の読み込みに失敗しました');
          },
        ),
      ),
    );
  }
}