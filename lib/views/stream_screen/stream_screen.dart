import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/stream_screen/providers/stream_screen_controller.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stream Screen',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          state.when(
            data: (data) => Text(data),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      )),
    );
  }
}
