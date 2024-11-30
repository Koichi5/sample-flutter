import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseTabControllerSample extends HookWidget {
  const UseTabControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    // useTabController を使用して TabController を作成
    final tabController = useTabController(initialLength: 3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useTabController サンプル'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'ホーム'),
            Tab(icon: Icon(Icons.search), text: '検索'),
            Tab(icon: Icon(Icons.person), text: 'プロフィール'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('ホームタブのコンテンツ')),
          Center(child: Text('検索タブのコンテンツ')),
          Center(child: Text('プロフィールタブのコンテンツ')),
        ],
      ),
    );
  }
}