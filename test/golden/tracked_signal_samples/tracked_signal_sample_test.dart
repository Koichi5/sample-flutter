import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/signals/tracked_signal_mixin_sample/tracked_signal_mixin_sample.dart';
import 'package:sample_flutter/signals/common/month.dart';
import '../../helpers/screenshot_helper.dart';

void main() {
  setUpAll(() {
    GoldenToolkit.runWithConfiguration(
      () async {
        await loadAppFonts();
      },
      config: GoldenToolkitConfiguration(
        enableRealShadows: true,
      ),
    );
  });

  group('Tracked Signal Sample Golden Tests', () {
    testGoldens('TrackedSignalMixinSample initial state', (tester) async {
      await screenshotWidget(
        widget: const TrackedSignalMixinSample(),
        name: 'tracked_signal_initial',
        tester: tester,
      );
    });

    testGoldens('TrackedSignalMixinSample after selection', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const TrackedSignalMixinSample(),
        ),
      );

      // 月を選択
      await tester.tap(find.byType(DropdownButtonFormField<Month>).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('february').last);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const TrackedSignalMixinSample(),
        name: 'tracked_signal_selected',
        tester: tester,
      );

      // Undoボタンをタップ
      await tester.tap(find.widgetWithText(TextButton, 'Undo').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const TrackedSignalMixinSample(),
        name: 'tracked_signal_undo',
        tester: tester,
      );
    });
  });
}
