import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/signals/change_stack_signal_mixin_sample/change_stack_signal_mixin_sample.dart';
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

  group('Change Stack Signal Sample Golden Tests', () {
    testGoldens('ChangeStackSignalMixinSample initial state', (tester) async {
      await screenshotWidget(
        widget: const ChangeStackSignalMixinSample(),
        name: 'change_stack_signal_initial',
        tester: tester,
      );
    });

    testGoldens('ChangeStackSignalMixinSample with history', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ChangeStackSignalMixinSample(),
        ),
      );

      // 月を選択（february）
      await tester.tap(find.byType(DropdownButtonFormField<Month>).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('february').last);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const ChangeStackSignalMixinSample(),
        name: 'change_stack_signal_first_selection',
        tester: tester,
      );

      // 月を選択（march）
      await tester.tap(find.byType(DropdownButtonFormField<Month>).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('march').last);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const ChangeStackSignalMixinSample(),
        name: 'change_stack_signal_second_selection',
        tester: tester,
      );

      // Undoボタンをタップ
      await tester.tap(find.widgetWithText(TextButton, 'Undo').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const ChangeStackSignalMixinSample(),
        name: 'change_stack_signal_undo',
        tester: tester,
      );

      // Redoボタンをタップ
      await tester.tap(find.widgetWithText(TextButton, 'Redo').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const ChangeStackSignalMixinSample(),
        name: 'change_stack_signal_redo',
        tester: tester,
      );
    });
  });
}
