import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/family_screen/providers/family_screen_controller.dart';

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int num1 = 1;
    const int num2 = 10;
    final state = ref.watch(FamilyScreenControllerProvider(num1, num2));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('$num1 + $num2'),
            Text('result: ${state.toString()}')
          ],
        ),
      ),
    );
  }
}
