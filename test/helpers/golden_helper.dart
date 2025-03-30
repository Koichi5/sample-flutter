import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:path/path.dart' as path;

/// 画面のスクリーンショットを撮影する
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

/// 変更前後の画像を比較する
Future<void> compareGoldens({
  required String testName,
  required String beforeImagePath,
  required String afterImagePath,
  required String outputPath,
}) async {
  final beforeFile = File(beforeImagePath);
  final afterFile = File(afterImagePath);

  if (!beforeFile.existsSync() || !afterFile.existsSync()) {
    throw Exception('Before or after image does not exist');
  }

  // 比較用ディレクトリを作成
  final comparisonDir = Directory(path.dirname(outputPath));
  if (!comparisonDir.existsSync()) {
    comparisonDir.createSync(recursive: true);
  }

  // 変更前後の画像をコピー
  final beforeCopy = File(path.join(
      comparisonDir.path, 'before_${path.basename(beforeImagePath)}'));
  final afterCopy = File(
      path.join(comparisonDir.path, 'after_${path.basename(afterImagePath)}'));
  beforeFile.copySync(beforeCopy.path);
  afterFile.copySync(afterCopy.path);

  // 差分情報をテキストファイルに保存
  final diffInfoFile =
      File(path.join(comparisonDir.path, '$testName.diff.txt'));
  diffInfoFile.writeAsStringSync('''
Test: $testName
Before: ${path.basename(beforeImagePath)}
After: ${path.basename(afterImagePath)}
Generated: ${DateTime.now().toIso8601String()}
''');
}

/// Golden Testのセットアップを行う
Future<void> setupGoldenTest() async {
  await loadAppFonts();
  // テスト用のディレクトリを作成
  final comparisonsDir = Directory('test/golden/comparisons');
  if (!comparisonsDir.existsSync()) {
    comparisonsDir.createSync(recursive: true);
  }
}
