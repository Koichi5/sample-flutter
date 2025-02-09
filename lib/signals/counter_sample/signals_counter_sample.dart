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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Signals Counter Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count Value:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Watch((context) => Text(
                  count.value.toString(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )),
            const SizedBox(height: 24),
            Watch((context) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: isOdd.value ? Colors.orange : Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
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
