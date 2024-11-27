import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// カスタム例外クラス
class FetchCancelledException implements Exception {
  final String message;
  FetchCancelledException(this.message);

  @override
  String toString() => message;
}

class StreamDownloadService {
  Completer<void>? _streamCompleter;
  StreamController<String>? _controller;

  /// ストリームを開始し、データの送信またはキャンセルを待機する
  Stream<String> startStream() {
    if (_streamCompleter != null && !_streamCompleter!.isCompleted) {
      // 既にストリームが実行中の場合は既存のストリームを返す
      return _controller!.stream;
    }

    _streamCompleter = Completer<void>();
    _controller = StreamController<String>();

    Timer? timer;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_streamCompleter!.isCompleted) {
        t.cancel();
      } else {
        _controller!.add('Message at ${DateTime.now()}');
      }
    });

    // キャンセルまたは完了時の処理
    _streamCompleter!.future.then((_) {
      _controller!.addError(FetchCancelledException('ストリームがキャンセルされました。'));
      _controller!.close();
      timer?.cancel();
    }).catchError((e) {
      if (!_streamCompleter!.isCompleted) {
        _controller!.addError('Stream failed: $e');
        _controller!.close();
        timer?.cancel();
      }
    });

    // // ストリームがキャンセルされたときの処理
    // _controller!.onCancel = () {
    //   if (!_streamCompleter!.isCompleted) {
    //     _streamCompleter!.complete();
    //   }
    // };

    return _controller!.stream;
  }

  /// ストリームをキャンセルする
  void cancelStream() {
    if (_streamCompleter != null && !_streamCompleter!.isCompleted) {
      _streamCompleter!.complete();
    }
  }
}

class CancelablestreamScreen extends HookWidget {
  const CancelablestreamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Completer と StreamSubscription を管理するためのフック
    final completer = useMemoized(() => Completer<void>());
    final subscription = useRef<StreamSubscription<String>?>(null);
    final messages = useState<List<String>>([]);
    final isRunning = useState<bool>(false);
    final downloadService = useMemoized(() => StreamDownloadService());

    // メッセージの取得を開始する関数
    void startTask() {
      isRunning.value = true;
      messages.value = [];

      // キャンセル可能なストリームを取得
      Stream<String> messageStream = downloadService.startStream();

      subscription.value = messageStream.listen(
        (message) {
          messages.value = [...messages.value, message];
        },
        onError: (error) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                ),
              ),
            );
          }
          isRunning.value = false;
        },
        onDone: () {
          isRunning.value = false;
        },
      );
    }

    // メッセージの取得をキャンセルする関数
    void cancelTask() {
      downloadService.cancelStream();
    }

    // クリーンアップ処理
    useEffect(() {
      return () {
        subscription.value?.cancel();
        if (!completer.isCompleted) {
          completer.complete();
        }
      };
    }, []);

    String buttonLabel = isRunning.value ? 'キャンセル' : '開始';
    VoidCallback? buttonAction = isRunning.value ? cancelTask : startTask;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Stream with Completer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: buttonAction,
              child: Text(buttonLabel),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: messages.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages.value[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
