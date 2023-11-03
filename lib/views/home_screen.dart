import 'package:flutter/material.dart';
import 'package:sample_flutter/views/routes/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ホーム',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                const HelloWorldRoute().go(context);
              },
              child: const Text('Hello World'),
            ),
            ElevatedButton(
              onPressed: () {
                const NotifierRoute().go(context);
              },
              child: const Text('Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                const FamilyRoute().go(context);
              },
              child: const Text('Family'),
            ),
            ElevatedButton(
              onPressed: () {
                const FutureRoute().go(context);
              },
              child: const Text('Future'),
            ),
            ElevatedButton(
              onPressed: () {
                const AsyncNotifierRoute().go(context);
              },
              child: const Text('Async Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                const StreamRoute().go(context);
              },
              child: const Text('Stream'),
            ),
          ],
        ),
      ),
    );
  }
}
