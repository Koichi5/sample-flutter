import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseScrollControllerSample extends HookWidget {
  const UseScrollControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    // useScrollController を使用して ScrollController を作成
    final scrollController = useScrollController();

    // ボタンの表示・非表示を管理する状態
    final showButton = useState<bool>(false);

    // スクロール位置の変化を監視するリスナーを設定
    useEffect(() {
      void listener() {
        if (scrollController.offset > 300 && !showButton.value) {
          showButton.value = true;
        } else if (scrollController.offset <= 300 && showButton.value) {
          showButton.value = false;
        }
      }

      scrollController.addListener(listener);

      return () => scrollController.removeListener(listener);
    }, [scrollController, showButton.value]);

    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('useScrollController サンプル'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text('アイテム $index'),
              );
            },
          ),
          // 「トップへ戻る」ボタンを右下に表示
          Positioned(
            bottom: 20,
            right: 20,
            child: AnimatedOpacity(
              opacity: showButton.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                onPressed: scrollToTop,
                tooltip: 'トップへ戻る',
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}