import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseAppLifecycleStateSample extends HookWidget {
  const UseAppLifecycleStateSample({super.key});

  @override
  Widget build(BuildContext context) {
    // アプリのライフサイクル状態を取得
    final lifecycleState = useAppLifecycleState();

    // 現在の状態を表示するための文字列
    String statusText;

    switch (lifecycleState) {
      case AppLifecycleState.resumed:
        statusText = 'アプリはフォアグラウンドにあります';
        break;
      case AppLifecycleState.inactive:
        statusText = 'アプリは非アクティブ状態です';
        break;
      case AppLifecycleState.paused:
        statusText = 'アプリはバックグラウンドに移行しました';
        break;
      case AppLifecycleState.detached:
        statusText = 'アプリはデタッチ状態です';
        break;
      default:
        statusText = '不明な状態';
    }

    // ライフサイクル状態が変化したときに debugPrint を呼び出す
    useEffect(() {
      debugPrint('現在のライフサイクル状態: $lifecycleState');
      return null;
    }, [lifecycleState]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ライフサイクル監視サンプル'),
      ),
      body: Center(
        child: Text(
          statusText,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}