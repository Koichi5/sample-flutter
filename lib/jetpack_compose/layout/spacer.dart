import 'package:flutter/material.dart';

class SpacerSample extends StatelessWidget {
  const SpacerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter')),
      body: const Column(
        children: [
          Text('Item 1'),
          SizedBox(height: 20),
          Text('Item 2'),
          SizedBox(height: 20),
          Text('Item 3'),
        ],
      ),
    );
  }
}

