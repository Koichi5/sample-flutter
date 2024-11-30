import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseRefSample extends HookWidget {
  const UseRefSample({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    final isRunning = useState<bool>(false);

    // タイマーを保持するための Ref
    final timerRef = useRef<Timer?>(null);

    void startTimer() {
      if (!isRunning.value) {
        timerRef.value = Timer.periodic(const Duration(seconds: 1), (timer) {
          counter.value += 1;
        });
        isRunning.value = true;
      }
    }

    void stopTimer() {
      if (isRunning.value) {
        timerRef.value?.cancel();
        timerRef.value = null;
        isRunning.value = false;
      }
    }

    useEffect(() {
      return () {
        timerRef.value?.cancel();
      };
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('useRef サンプル'),
      ),
      body: Center(
        child: Text(
          'カウンター: ${counter.value}',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: !isRunning.value
          ? FloatingActionButton(
              onPressed: startTimer,
              tooltip: '開始',
              child: const Icon(Icons.play_arrow),
            )
          : FloatingActionButton(
              onPressed: stopTimer,
              tooltip: '停止',
              child: const Icon(Icons.stop),
            ),
    );
  }
}
