import 'package:async_queue/async_queue.dart';
import 'package:flutter/material.dart';

class AsyncQueueSample extends StatelessWidget {
  const AsyncQueueSample({super.key});

  Future<void> _asyncTask() async {
    final asyncQ = AsyncQueue();
    asyncQ.addJob(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => debugPrint("normalQ: 1"),
      ),
    );
    asyncQ.addJob(
      (_) => Future.delayed(
        const Duration(seconds: 4),
        () => debugPrint("normalQ: 2"),
      ),
    );
    asyncQ.addJob(
      (_) => Future.delayed(
        const Duration(seconds: 2),
        () => debugPrint("normalQ: 3"),
      ),
    );
    asyncQ.addJob(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => debugPrint("normalQ: 4"),
      ),
    );

    await asyncQ.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _asyncTask,
          child: const Text('asyncTask'),
        ),
      ),
    );
  }
}
