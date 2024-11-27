import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_flutter/main.dart';

// Run : flutter test --update-goldens --tags=golden

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await loadAppFonts();

  testGoldens('MyHomePage', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Noto Sans JP',
          ),
          home: const MyHomePage(
            title: 'GoldenTestサンプル',
          ),
        ),
        name: 'MyHomePage',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'my_home_page');
  });
}
