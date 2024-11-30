import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseFocusScopeNodeSample extends HookWidget {
  const UseFocusScopeNodeSample({super.key});

  @override
  Widget build(BuildContext context) {
    // フォーカススコープノードを作成
    final focusScopeNode = useFocusScopeNode();

    // 各テキストフィールド用の FocusNode を作成
    final focusNode1 = useFocusNode();
    final focusNode2 = useFocusNode();
    final focusNode3 = useFocusNode();

    // テキストフィールドの入力内容を管理する状態
    final text1 = useState<String>('');
    final text2 = useState<String>('');
    final text3 = useState<String>('');

    // フォーカススコープ内でのフォーカス移動用メソッド
    void moveToNextField(FocusNode current, FocusNode next) {
      // 現在のフィールドのフォーカスを外し、次のフィールドにフォーカスを移動
      current.unfocus();
      next.requestFocus();
    }

    return FocusScope(
      node: focusScopeNode,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('useFocusScopeNode サンプル'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // テキストフィールド1
              TextField(
                focusNode: focusNode1,
                decoration: const InputDecoration(
                  labelText: '名前',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  text1.value = value;
                },
                onSubmitted: (_) {
                  moveToNextField(focusNode1, focusNode2);
                },
              ),
              const SizedBox(height: 20),
              // テキストフィールド2
              TextField(
                focusNode: focusNode2,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  text2.value = value;
                },
                onSubmitted: (_) {
                  moveToNextField(focusNode2, focusNode3);
                },
              ),
              const SizedBox(height: 20),
              // テキストフィールド3
              TextField(
                focusNode: focusNode3,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  text3.value = value;
                },
                onSubmitted: (_) {
                  // 入力完了後、フォーカスを全て外す
                  focusScopeNode.unfocus();
                  // 入力内容を表示（デバッグ目的）
                  debugPrint('名前: ${text1.value}');
                  debugPrint('メールアドレス: ${text2.value}');
                  debugPrint('パスワード: ${text3.value}');
                },
              ),
              const SizedBox(height: 30),
              // フォーカス制御ボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // 名前フィールドにフォーカス
                      focusNode1.requestFocus();
                    },
                    child: const Text('名前にフォーカス'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // メールアドレスフィールドにフォーカス
                      focusNode2.requestFocus();
                    },
                    child: const Text('メールアドレスにフォーカス'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // パスワードフィールドにフォーカス
                      focusNode3.requestFocus();
                    },
                    child: const Text('パスワードにフォーカス'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // フォーカス全体のリセットボタン
              ElevatedButton(
                onPressed: () {
                  // フォーカススコープ内の全てのフォーカスをリセット
                  focusScopeNode.unfocus();
                },
                child: const Text('フォーカスをリセット'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}