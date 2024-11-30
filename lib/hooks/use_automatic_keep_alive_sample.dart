import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseAutomaticKeepAliveSample extends StatelessWidget {
  const UseAutomaticKeepAliveSample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('タブ状態保持サンプル'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'タブ 1'),
              Tab(text: 'タブ 2'),
              Tab(text: 'タブ 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _CounterTab(tabNumber: 1),
            _CounterTab(tabNumber: 2),
            _CounterTab(tabNumber: 3),
          ],
        ),
      ),
    );
  }
}

class _CounterTab extends HookWidget {
  const _CounterTab({required this.tabNumber});

  final int tabNumber;

  @override
  Widget build(BuildContext context) {
    // 状態を保持するためのカウンター
    final counter = useState<int>(0);

    // ウィジェットの状態を保持するために useAutomaticKeepAlive を使用
    useAutomaticKeepAlive();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('タブ $tabNumber のカウンター:', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Text(
            '${counter.value}',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              counter.value += 1;
            },
            child: const Text('カウントアップ'),
          ),
        ],
      ),
    );
  }
}
