import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedSample extends HookWidget {
  const UseMemoizedSample({super.key});

  int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  @override
  Widget build(BuildContext context) {
    // フィボナッチ数の計算をメモ化
    final fibResult = useMemoized(() => fibonacci(40), []);
    final result = useState<int>(fibResult);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useMemoized サンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('フィボナッチ(40) の結果: ${result.value}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                result.value = fibResult;
              },
              child: const Text('結果を更新'),
            ),
          ],
        ),
      ),
    );
  }
}