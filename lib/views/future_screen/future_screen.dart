import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/future_screen/providers/future_screen_controller.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futureScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Future screen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.when(
              data: (data) => Text(data),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
