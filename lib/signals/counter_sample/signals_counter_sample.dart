import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class SignalsCounterSample extends StatelessWidget {
  const SignalsCounterSample({super.key});

  @override
  Widget build(BuildContext context) {
    late final count = signal(0);
    late final isOdd = computed(() => count.value.isOdd);
    effect(() {
      debugPrint('effect count: $count');
    });
    count.subscribe((value) {  // effect, subscribe どちらでも値の監視が可能
      debugPrint('subscribe count: $value');
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
