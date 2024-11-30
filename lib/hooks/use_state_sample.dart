import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// useState
class UseStateSample extends HookWidget {
  const UseStateSample({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () => count.value++,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: () => count.value--,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ValueNotifier
class ValueNotifierSample extends StatefulWidget {
  const ValueNotifierSample({super.key});

  @override
  ValueNotifierSampleState createState() => ValueNotifierSampleState();
}

class ValueNotifierSampleState extends State<ValueNotifierSample> {
  // ValueNotifier を使用して状態を管理
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    // ValueNotifier のリスナーを追加
    _counter.addListener(_onCounterChanged);
  }

  void _onCounterChanged() {
    // ValueNotifier の値が変更されたらウィジェットを再ビルド
    setState(() {});
  }

  @override
  void dispose() {
    // リスナーを削除し、ValueNotifier を破棄
    _counter.removeListener(_onCounterChanged);
    _counter.dispose();
    super.dispose();
  }

  void _increment() {
    _counter.value += 1;
  }

  void _decrement() {
    _counter.value -= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
