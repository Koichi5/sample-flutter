import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

// StatefulWidget に対して SignalsMixin を渡す方法で実装すると VSCodeで reload しても値が保持される
// 簡易的ではあるが、ビューがリビルドされても値が更新されないことがわかる
class SignalsMixinCounterSample extends StatefulWidget {
  const SignalsMixinCounterSample({super.key});

  @override
  State<SignalsMixinCounterSample> createState() =>
      _SignalsMixinCounterSampleState();
}

class _SignalsMixinCounterSampleState extends State<SignalsMixinCounterSample>
    with SignalsMixin {
  late final count = signal(0);
  late final isOdd = computed(() => count.value.isOdd);

  @override
  Widget build(BuildContext context) {
    createEffect(() {
      debugPrint('effect count: $count');
    });

    listenSignal(count, () {
      debugPrint('subscribe count: $count');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Counter Sample'),
      ),
      body: Center(
        child: Watch((context) => Text("Count: $count,  isOdd: $isOdd")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
