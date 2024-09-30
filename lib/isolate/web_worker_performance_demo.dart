import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WebWorkerPerformanceDemo extends HookWidget {
  const WebWorkerPerformanceDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final useWorker = useState(true);
    final executionTime = useState(0);
    final operationsPerSecond = useState(0);
    final fps = useState(0.0);
    final workerVsMainThread = useState<Map<String, int>>({});
    final isRunningTest = useState(false);

    final workerRef = useState<html.Worker?>(null);

    useEffect(() {
      workerRef.value = html.Worker('fibonacci_worker.js');
      return () => workerRef.value?.terminate();
    }, const []);

    Future<void> runPerformanceTests() async {
      isRunningTest.value = true;

      // Execution Time Test
      final startTime = DateTime.now();
      if (useWorker.value) {
        executionTime.value = await runWorkerTask(workerRef.value!, 40);
      } else {
        fibonacci(40);
        final endTime = DateTime.now();
        executionTime.value = endTime.difference(startTime).inMilliseconds;
      }

      // Operations Per Second Test
      int count = 0;
      final testDuration = const Duration(seconds: 1);
      final stopwatch = Stopwatch()..start();
      if (useWorker.value) {
        while (stopwatch.elapsed < testDuration) {
          await runWorkerTask(workerRef.value!, 20);
          count++;
        }
      } else {
        while (stopwatch.elapsed < testDuration) {
          fibonacci(20);
          count++;
        }
      }
      operationsPerSecond.value = count;

      // FPS Test
      fps.value =
          await measureFPS(useWorker: useWorker.value, worker: workerRef.value);

      // Worker vs Main Thread Test
      workerVsMainThread.value =
          await compareWorkerVsMainThread(workerRef.value!);

      isRunningTest.value = false;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Performance Metrics Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Use Web Worker:'),
                Switch(
                  value: useWorker.value,
                  onChanged: (value) {
                    useWorker.value = value;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: isRunningTest.value ? null : runPerformanceTests,
              child: const Text('Run Performance Tests'),
            ),
            const SizedBox(height: 20),
            if (isRunningTest.value)
              const CircularProgressIndicator()
            else
              Column(
                children: [
                  Text(
                      'Execution Time (fibonacci(40)): ${executionTime.value}ms'),
                  Text(
                      'Operations per Second (fibonacci(20)): ${operationsPerSecond.value}'),
                  Text(
                      'FPS during heavy computation: ${fps.value.toStringAsFixed(2)}'),
                  Text('Worker vs Main Thread:'),
                  Text('  Worker: ${workerVsMainThread.value['worker']}ms'),
                  Text('  Main Thread: ${workerVsMainThread.value['main']}ms'),
                ],
              ),
          ],
        ),
      ),
    );
  }

  int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  Future<int> runWorkerTask(html.Worker worker, int n) {
    final completer = Completer<int>();
    worker.onMessage.listen((event) {
      if (event.data['type'] == 'result') {
        completer.complete(event.data['duration']);
      } else if (event.data['type'] == 'progress') {
        // 進捗状況を更新する（必要に応じて）
        debugPrint(
            'Progress: ${(event.data['value'] * 100).toStringAsFixed(2)}%');
      } else if (event.data['type'] == 'error') {
        completer.completeError(event.data['message']);
      }
    });
    worker.postMessage(n);
    return completer.future;
  }

  Future<double> measureFPS(
      {required bool useWorker, required html.Worker? worker}) async {
    int frameCount = 0;
    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < const Duration(seconds: 5)) {
      await Future.delayed(const Duration(milliseconds: 16)); // ~60 FPS
      frameCount++;
      if (useWorker) {
        await runWorkerTask(worker!, 20);
      } else {
        fibonacci(20);
      }
    }

    return frameCount / (stopwatch.elapsedMilliseconds / 1000);
  }

  Future<Map<String, int>> compareWorkerVsMainThread(html.Worker worker) async {
    // Worker Thread
    // final workerStart = DateTime.now();
    final workerTime = await runWorkerTask(worker, 35);

    // Main Thread
    final mainStart = DateTime.now();
    fibonacci(35);
    final mainEnd = DateTime.now();
    final mainTime = mainEnd.difference(mainStart).inMilliseconds;

    return {
      'worker': workerTime,
      'main': mainTime,
    };
  }
}
