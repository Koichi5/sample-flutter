import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseFocusNodeSample extends HookWidget {
  const UseFocusNodeSample({super.key});

  @override
  Widget build(BuildContext context) {
    // 各テキストフィールド用の FocusNode を作成
    final focusNode1 = useFocusNode();
    final focusNode2 = useFocusNode();
    final focusNode3 = useFocusNode();

    // テキストフィールドの入力内容を管理する状態
    final text1 = useState<String>('');
    final text2 = useState<String>('');
    final text3 = useState<String>('');

    useEffect(() {
      // クリーンアップ
      return () {
        focusNode1.dispose();
        focusNode2.dispose();
        focusNode3.dispose();
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useFocusNode サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                // Field2 にフォーカスを移動
                FocusScope.of(context).requestFocus(focusNode2);
              },
            ),
            const SizedBox(height: 20),
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
                // Field3 にフォーカスを移動
                FocusScope.of(context).requestFocus(focusNode3);
              },
            ),
            const SizedBox(height: 20),
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
                // キーボードを閉じる
                focusNode3.unfocus();
                debugPrint('名前: ${text1.value}');
                debugPrint('メールアドレス: ${text2.value}');
                debugPrint('パスワード: ${text3.value}');
              },
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(focusNode1);
                  },
                  child: const Text('名前にフォーカス'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                  child: const Text('メールアドレスにフォーカス'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(focusNode3);
                  },
                  child: const Text('パスワードにフォーカス'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}