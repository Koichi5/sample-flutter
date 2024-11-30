import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UsePageControllerSample extends HookWidget {
  const UsePageControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    // usePageController を使用して PageController を作成
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState<int>(0);

    useEffect(() {
      void listener() {
        currentPage.value = pageController.page?.round() ?? 0;
      }

      pageController.addListener(listener);

      return () => pageController.removeListener(listener);
    }, [pageController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('usePageController サンプル'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                Center(
                  child: Text(
                    'ページ 1',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'ページ 2',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'ページ 3',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                width: currentPage.value == index ? 12 : 8,
                height: currentPage.value == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentPage.value == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if (currentPage.value > 0) {
                      pageController.animateToPage(
                        currentPage.value - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('前へ'),
                ),
                TextButton(
                  onPressed: () {
                    if (currentPage.value < 2) {
                      pageController.animateToPage(
                        currentPage.value + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('次へ'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
