import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksCounterSample extends HookWidget {
  const HooksCounterSample({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    final isOdd = useMemoized(() => count.value.isOdd, [count.value]);
    useEffect(() {
      debugPrint('count: ${count.value}');
      return null;
    }, [count.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks Counter Sample'),
      ),
      body: Center(
        child: Text('Count: ${count.value},  isOdd: $isOdd'),
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

