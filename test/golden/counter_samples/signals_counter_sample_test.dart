import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/signals/counter_sample/signals_counter_sample.dart';
import '../../helpers/screenshot_helper.dart';

void main() {
  setUpAll(() {
    // Golden Testの設定
    GoldenToolkit.runWithConfiguration(
      () async {
        await loadAppFonts();
      },
      config: GoldenToolkitConfiguration(
        enableRealShadows: true,
      ),
    );
  });

  group('Counter Sample Golden Tests', () {
    testGoldens('SignalsCounterSample initial state', (tester) async {
      await screenshotWidget(
        widget: const SignalsCounterSample(),
        name: 'signals_counter_initial',
        tester: tester,
      );
    });

    testGoldens('SignalsCounterSample after increment', (tester) async {
      final widget = const SignalsCounterSample();
      await tester.pumpWidget(
        MaterialApp(
          home: widget,
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      await screenshotWidget(
        widget: widget,
        name: 'signals_counter_incremented',
        tester: tester,
      );
    });
  });
}
