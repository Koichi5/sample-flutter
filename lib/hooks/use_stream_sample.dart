import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStreamSample extends HookWidget {
  const UseStreamSample({super.key});

  @override
  Widget build(BuildContext context) {
    // ストリームの作成: 1秒ごとにカウントを増加させる
    Stream<int> streamCounter() async* {
      int i = 0;
      while (true) {
        yield i++;
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    final countStream = useMemoized(streamCounter);
    final count = useStream(countStream).data ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('useStream サンプル'),
      ),
      body: Center(
        child: Text(
          'カウント: $count',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
