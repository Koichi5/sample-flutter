import 'package:flutter/material.dart';

class AssetImageScreen extends StatelessWidget {
  const AssetImageScreen({super.key, required this.imageAssetPath});

  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像表示'),
      ),
      body: Center(
        child: Image.asset(
          imageAssetPath,
          errorBuilder: (context, error, stackTrace) {
            return const Text('画像の読み込みに失敗しました');
          },
        ),
      ),
    );
  }
}