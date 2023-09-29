import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/async_notifier_screen/providers/async_notifier_screen_controller.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncNotifierScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncNotifier Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.when(
                data: (data) => Text(data),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            label: const Icon(Icons.add),
            heroTag: 'get',
            onPressed: () {
              ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .setNewWord();
            },
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            label: const Icon(Icons.delete),
            heroTag: 'delete',
            onPressed: () {
              ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .deleteWord();
            },
          ),
        ],
      ),
    );
  }
}
