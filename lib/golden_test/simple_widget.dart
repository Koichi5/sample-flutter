import 'package:flutter/material.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sample Text 1',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Text(
              'Sample Text 2',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              'Sample Text 3',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
