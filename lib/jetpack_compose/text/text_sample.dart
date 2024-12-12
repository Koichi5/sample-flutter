import 'package:flutter/material.dart';

class TextSample extends StatelessWidget {
  const TextSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'H',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              TextSpan(text: 'ello '),
              TextSpan(
                text: 'J',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              TextSpan(text: 'etpack Compose'),
            ],
          ),
        ),
      ),
    );
  }
}

// Text(
//   'Too long long long long long long long',
//   style: TextStyle(
//     fontSize: 30,
//   ),
//   softWrap: false,
// ),
