import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/notifier_screen/providers/notifier_screen_controller.dart';

class NotifierScreen extends ConsumerWidget {
  const NotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notifierScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('$state', style: const TextStyle(fontSize: 20),)],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(notifierScreenControllerProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.read(notifierScreenControllerProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
