import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/signals/counter_sample/signals_counter_sample.dart';
import '../../helpers/golden_helper.dart';

void main() {
  group('Signals Counter Sample Golden Tests', () {
    testGoldens('初期状態のスクリーンショット', (tester) async {
      await setupGoldenTest();

      await screenshotWidget(
        widget: const SignalsCounterSample(),
        name: 'signals_counter_initial',
        tester: tester,
      );
    });

    testGoldens('カウントアップ後のスクリーンショット', (tester) async {
      await setupGoldenTest();

      await tester.pumpWidget(
        const MaterialApp(
          home: SignalsCounterSample(),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const SignalsCounterSample(),
        name: 'signals_counter_incremented',
        tester: tester,
      );
    });
  });
}
