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
    count.subscribe((value) {
      // effect, subscribe どちらでも値の監視が可能
      debugPrint('subscribe count: $value');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Counter Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Watch((context) => Text(
                  count.value.toString(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )),
            const SizedBox(height: 16),
            Watch((context) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isOdd.value ? Colors.orange : Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isOdd.value ? 'Odd' : 'Even',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          count.value++;
        },
        icon: const Icon(Icons.add),
        label: const Text('Increment'),
      ),
    );
  }
}
