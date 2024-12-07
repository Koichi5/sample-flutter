import 'package:flutter/material.dart';

class MyHomePageWithRestoration extends StatefulWidget {
  const MyHomePageWithRestoration({super.key});

  @override
  State<MyHomePageWithRestoration> createState() =>
      _MyHomePageWithRestorationState();
}

class _MyHomePageWithRestorationState extends State<MyHomePageWithRestoration>
    with RestorationMixin {
  // RestorableIntを使用してカウンターの状態を管理
  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'home_page_with_restoration'; // 一意のIDを設定

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // 状態を登録
    registerForRestoration(_counter, 'counter');
  }

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestorationMixin 使用例'),
      ),
      body: Center(
        child: Text(
          'ボタンが ${_counter.value} 回押されました。',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }
}
