import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseCallbackSample extends HookWidget {
  const UseCallbackSample({super.key});

  @override
  Widget build(BuildContext context) {
    // カウンターの状態を管理
    final counter = useState<int>(0);

    // useCallback を使用してコールバック関数をメモ化
    final incrementCounter = useCallback(() {
      counter.value += 1;
    }, [counter]);

    final decrementCounter = useCallback(() {
      counter.value -= 1;
    }, [counter]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useCallback サンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'カウンターの値:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${counter.value}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // 子ウィジェットにコールバックを渡す
            _ChildWidget(
              incrementCounter: incrementCounter,
              decrementCounter: decrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChildWidget extends HookWidget {
  const _ChildWidget({
    required this.incrementCounter,
    required this.decrementCounter,
  });
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: incrementCounter,
          icon: const Icon(Icons.add, color: Colors.red),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: decrementCounter,
          icon: const Icon(Icons.remove, color: Colors.blue),
        ),
      ],
    );
  }
}
