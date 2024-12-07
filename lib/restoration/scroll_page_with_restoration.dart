import 'package:flutter/material.dart';

class MyHomePageWithScrollRestoration extends StatefulWidget {
  const MyHomePageWithScrollRestoration({super.key, this.title});
  final String? title;

  @override
  State<MyHomePageWithScrollRestoration> createState() => _MyHomePageWithScrollRestorationState();
}

class _MyHomePageWithScrollRestorationState extends State<MyHomePageWithScrollRestoration>
    with RestorationMixin {

  // RestorableScrollOffsetを使用してスクロールの状態を管理
  final RestorableDouble _scrollOffset = RestorableDouble(0);
  late ScrollController _scrollController;

  @override
  String? get restorationId => 'my_home_page_with_scroll_restoration'; // 一意のIDを設定

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // スクロールオフセットの状態を登録
    registerForRestoration(_scrollOffset, 'list_scroll_offset');
    _scrollController = ScrollController(initialScrollOffset: _scrollOffset.value);
    _scrollController.addListener(_syncScrollOffset);
  }

  void _syncScrollOffset() {
    _scrollOffset.value = _scrollController.offset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_syncScrollOffset);
    _scrollOffset.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // サンプルデータの作成
    final List<String> items = List<String>.generate(100, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'With RestorationMixin'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        restorationId: 'list_view', // 追加の復元ID（オプション）
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}