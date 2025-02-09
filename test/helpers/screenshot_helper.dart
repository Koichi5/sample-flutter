import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> screenshotWidget({
  required Widget widget,
  required String name,
  required WidgetTester tester,
  List<Device> devices = const [
    Device(size: Size(400, 800), name: 'phone'),
    Device(size: Size(800, 1200), name: 'tablet'),
  ],
}) async {
  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(devices: devices)
    ..addScenario(
      widget: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: widget,
      ),
    );

  await tester.pumpDeviceBuilder(builder);
  await screenMatchesGolden(tester, name);
}
