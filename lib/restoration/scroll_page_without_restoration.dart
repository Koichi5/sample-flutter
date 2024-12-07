import 'package:flutter/material.dart';

class MyHomePageWithoutScrollRestoration extends StatefulWidget {
  const MyHomePageWithoutScrollRestoration({super.key, this.title});
  final String? title;

  @override
  State<MyHomePageWithoutScrollRestoration> createState() => _MyHomePageWithoutRestorationState();
}

class _MyHomePageWithoutRestorationState extends State<MyHomePageWithoutScrollRestoration> {
  int counter = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // サンプルデータの作成
    final List<String> items = List<String>.generate(100, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Without RestorationMixin'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}