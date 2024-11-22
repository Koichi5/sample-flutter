import 'package:flutter/material.dart';

class FontSampleScreen extends StatelessWidget {
  const FontSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'フォントサンプル',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            '特殊文字： ᶠˡᵘᵗᵗᵉʳ',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Lato',
              fontFamilyFallback: ['NotoSans'],
              ),
          ),
        ),
      ),
    );
  }
}
