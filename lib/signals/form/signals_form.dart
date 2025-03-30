import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SignalsForm extends StatelessWidget {
  final String initialName;
  final String initialEmail;

  SignalsForm({
    super.key,
    required this.initialName,
    required this.initialEmail,
  }) {
    // フォームの状態管理
    name = signal(initialName);
    email = signal(initialEmail);

    // フォームの変更検知
    isFormChanged = computed(() {
      return name.value != initialName || email.value != initialEmail;
    });
  }

  late final Signal<String> name;
  late final Signal<String> email;
  late final ReadonlySignal<bool> isFormChanged;

  // 画面を閉じる前の確認ダイアログ
  Future<bool> showExitConfirmDialog(BuildContext context) async {
    if (!isFormChanged.value) return true;

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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final canPop = await showExitConfirmDialog(context);
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
              Watch((context) {
                return TextField(
                  controller: TextEditingController(text: name.value)
                    ..selection = TextSelection.collapsed(
                      offset: name.value.length,
                    ),
                  onChanged: (value) => name.value = value,
                  decoration: const InputDecoration(
                    labelText: '名前',
                    border: OutlineInputBorder(),
                  ),
                );
              }),
              const SizedBox(height: 16),
              // メールアドレス入力フィールド
              Watch((context) {
                return TextField(
                  controller: TextEditingController(text: email.value)
                    ..selection = TextSelection.collapsed(
                      offset: email.value.length,
                    ),
                  onChanged: (value) => email.value = value,
                  decoration: const InputDecoration(
                    labelText: 'メールアドレス',
                    border: OutlineInputBorder(),
                  ),
                );
              }),
              const Spacer(),
              // 変更ボタン
              SizedBox(
                width: double.infinity,
                child: Watch((context) {
                  return FilledButton(
                    onPressed: isFormChanged.value
                        ? () {
                            // TODO: 変更内容の保存処理
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: const Text('変更'),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
