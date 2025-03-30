import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/signals/event_sink_signal_mixin_sample/event_sink_signal_mixin_sample.dart';
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

  group('Event Sink Signal Sample Golden Tests', () {
    testGoldens('EventSinkSignalMixinSample initial state', (tester) async {
      await screenshotWidget(
        widget: const EventSinkSignalMixinSample(),
        name: 'event_sink_signal_initial',
        tester: tester,
      );
    });

    testGoldens('EventSinkSignalMixinSample with events', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const EventSinkSignalMixinSample(),
        ),
      );

      // Add countをタップ
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add count').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const EventSinkSignalMixinSample(),
        name: 'event_sink_signal_add_count',
        tester: tester,
      );

      // Add errorをタップ
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add error').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const EventSinkSignalMixinSample(),
        name: 'event_sink_signal_add_error',
        tester: tester,
      );

      // Closeをタップ
      await tester.tap(find.widgetWithText(ElevatedButton, 'Close').first);
      await tester.pumpAndSettle();

      await screenshotWidget(
        widget: const EventSinkSignalMixinSample(),
        name: 'event_sink_signal_closed',
        tester: tester,
      );
    });
  });
}
