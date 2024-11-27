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

class FutureDownloadService {
  Completer<void>? _downloadCompleter;

  /// ダウンロードを開始し、ダウンロード完了またはキャンセルを待機する
  Future<void> startDownload() {
    if (_downloadCompleter != null && !_downloadCompleter!.isCompleted) {
      // 既にダウンロードが実行中の場合は既存の Future を返す
      return _downloadCompleter!.future;
    }

    _downloadCompleter = Completer<void>();

    // ダウンロードプロセスをシミュレート
    Future.delayed(const Duration(seconds: 5)).then((_) {
      if (!_downloadCompleter!.isCompleted) {
        _downloadCompleter!.complete();
      }
    });

    return _downloadCompleter!.future;
  }

  /// ダウンロードをキャンセルする
  void cancelDownload() {
    if (_downloadCompleter != null && !_downloadCompleter!.isCompleted) {
      _downloadCompleter!.completeError(
        FetchCancelledException('ダウンロードがキャンセルされました。'),
      );
    }
  }
}

class CancelableFutureScreen extends HookWidget {
  const CancelableFutureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DownloadService のインスタンスを作成
    final downloadService = useMemoized(() => FutureDownloadService());

    // その他のフック
    final isRunning = useState<bool>(false);
    final messages = useState('');
    final elapsedSeconds = useState<int>(0);

    // クリーンアップ処理
    useEffect(() {
      return () {
        downloadService.cancelDownload(); // ウィジェットが破棄される際にキャンセル信号を送る
      };
    }, [downloadService]);

    // タスクを開始する関数
    Future<void> startTask() async {
      isRunning.value = true;
      messages.value = '';
      elapsedSeconds.value = 0;

      // タイマーで経過時間をカウント
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        elapsedSeconds.value += 1;
      });

      try {
        // DownloadService のタスクを開始
        await downloadService.startDownload();

        // タスクが正常に完了した場合のメッセージ
        messages.value = 'ダウンロードが正常に完了しました。';
      } on FetchCancelledException catch (e) {
        // キャンセルされた場合にスナックバーを表示
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('予期しないエラーが発生しました: $e')),
          );
        }
      } finally {
        timer.cancel(); // タイマーを停止
        isRunning.value = false;
      }
    }

    // タスクをキャンセルする関数
    void cancelTask() {
      downloadService.cancelDownload(); // DownloadService を通じてタスクをキャンセル
    }

    // ボタンのラベルと動作を決定
    String buttonLabel = isRunning.value ? 'キャンセル' : '開始';
    VoidCallback? buttonAction = isRunning.value ? cancelTask : startTask;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Future with DownloadService'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: buttonAction,
                child: Text(buttonLabel),
              ),
              const SizedBox(height: 20),
              if (isRunning.value) ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                  '進行中: ${elapsedSeconds.value}秒',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
              const SizedBox(height: 8),
              Text(messages.value),
            ],
          ),
        ),
      ),
    );
  }
}
