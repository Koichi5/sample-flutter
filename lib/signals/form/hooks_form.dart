import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksForm extends HookWidget {
  final String initialName;
  final String initialEmail;

  const HooksForm({
    super.key,
    required this.initialName,
    required this.initialEmail,
  });

  @override
  Widget build(BuildContext context) {
    // フォームの状態管理
    final name = useState(initialName);
    final email = useState(initialEmail);

    // フォームの変更検知
    final isFormChanged = useMemoized(
      () => name.value != initialName || email.value != initialEmail,
      [name.value, email.value],
    );

    // 画面を閉じる前の確認ダイアログ
    Future<bool> showExitConfirmDialog() async {
      if (!isFormChanged) return true;

      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('確認'),
          content: const Text('変更内容が保存されていません。\n画面を閉じてもよろしいですか？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return result ?? false;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final canPop = await showExitConfirmDialog();
        if (canPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール編集'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 名前入力フィールド
              TextField(
                controller: useTextEditingController(text: name.value),
                onChanged: (value) => name.value = value,
                decoration: const InputDecoration(
                  labelText: '名前',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // メールアドレス入力フィールド
              TextField(
                controller: useTextEditingController(text: email.value),
                onChanged: (value) => email.value = value,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              // 変更ボタン
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isFormChanged
                      ? () {
                          // TODO: 変更内容の保存処理
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text('変更'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
