import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseOnAppLifecycleStateChangeSample extends HookWidget {
  const UseOnAppLifecycleStateChangeSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusText = useState('不明な状態');

    useOnAppLifecycleStateChange((beforeState, currState) {
      switch (currState) {
        case AppLifecycleState.resumed:
          statusText.value = 'アプリはフォアグラウンドにあります';
          debugPrint('アプリはフォアグラウンドにあります');
          break;
        case AppLifecycleState.inactive:
          statusText.value = 'アプリは非アクティブ状態です';
          debugPrint('アプリは非アクティブ状態です');
          break;
        case AppLifecycleState.paused:
          statusText.value = 'アプリは一時停止しました';
          debugPrint('アプリは一時停止しました');
          break;
        case AppLifecycleState.detached:
          statusText.value = 'アプリは終了しました';
          debugPrint('アプリは終了しました');
          break;
        case AppLifecycleState.hidden:
          statusText.value = 'アプリは非表示になりました';
          debugPrint('アプリは非表示になりました');
          break;
        default:
          statusText.value = '不明な状態';
          debugPrint('不明な状態');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('useOnAppLifecycleStateChange サンプル'),
      ),
      body: Center(
        child: Text(statusText.value),
      ),
    );
  }
}
