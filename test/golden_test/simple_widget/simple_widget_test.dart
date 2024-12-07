import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/golden_test/simple_widget.dart';

Future<void> main() async {
  testGoldens('SimpleWidget Golden Test', (tester) async {
    final devices = [
      Device.iphone11,
      Device.tabletPortrait,
      Device.tabletLandscape,
    ];
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: devices)
      ..addScenario(widget: const SimpleWidget(), name: 'simple_widget');

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'simple_widget');
  });
}
