import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwiftOnFlutterSampleScreen extends HookWidget {
  const SwiftOnFlutterSampleScreen({super.key});

  // Swift側のメソッドチャンネルと紐付ける
  final MethodChannel _methodChannel = const MethodChannel('com.example.flutter');

  @override
  Widget build(BuildContext context) {
    final result = useState('Swift から値を取得してみましょう');
    Future helloSwift() async {
      try {
        var response = await _methodChannel.invokeMethod('helloSwift');
        result.value = response;
      } on PlatformException catch (e) {
        log(e.message ?? 'Unexpected PlatformException');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiftのコードを呼び出し"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(result.value),
            ),
            ElevatedButton(
              onPressed: () {
                helloSwift();
              },
              child: const Text('Swift 呼び出し'),
            ),
          ],
        ),
      ),
    );
  }
}
