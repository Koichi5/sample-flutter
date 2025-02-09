import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter/signals/counter_sample/signals_counter_sample.dart';
import '../../helpers/golden_helper.dart';

void main() {
  group('Signals Counter Sample Golden Tests', () {
    testWidgets('初期状態のスクリーンショット', (tester) async {
      await setupGoldenTest();

      await screenshotWidget(
        widget: const SignalsCounterSample(),
        name: 'signals_counter_initial',
        tester: tester,
      );

      await compareGoldens(
        testName: 'signals_counter_initial',
        beforeImagePath: 'test/golden/signals_counter_initial.png',
        afterImagePath: 'test/golden/signals_counter_initial.png',
        outputPath:
            'test/golden/comparisons/signals_counter_initial/comparison.txt',
      );
    });

    testWidgets('カウントアップ後のスクリーンショット', (tester) async {
      await setupGoldenTest();

      await tester.pumpWidget(const SignalsCounterSample());
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      await screenshotWidget(
        widget: const SignalsCounterSample(),
        name: 'signals_counter_incremented',
        tester: tester,
      );

      await compareGoldens(
        testName: 'signals_counter_incremented',
        beforeImagePath: 'test/golden/signals_counter_incremented.png',
        afterImagePath: 'test/golden/signals_counter_incremented.png',
        outputPath:
            'test/golden/comparisons/signals_counter_incremented/comparison.txt',
      );
    });
  });
}
