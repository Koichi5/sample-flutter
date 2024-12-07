import 'package:flutter/material.dart';

class MyHomePageWithoutRestoration extends StatefulWidget {
  const MyHomePageWithoutRestoration({super.key});

  @override
  State<MyHomePageWithoutRestoration> createState() =>
      _MyHomePageWithoutRestorationState();
}

class _MyHomePageWithoutRestorationState
    extends State<MyHomePageWithoutRestoration> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestorationMixin 非使用例'),
      ),
      body: Center(
        child: Text(
          'ボタンが $_counter 回押されました。',
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
