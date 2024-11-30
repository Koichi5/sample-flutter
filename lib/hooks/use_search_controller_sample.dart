import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseSearchControllerSample extends HookWidget {
  const UseSearchControllerSample({super.key});

  @override
  Widget build(BuildContext context) {
    // `useSearchController` を使用して TextEditingController を作成
    final searchController = useSearchController();
    final filteredList = useState<List<String>>([]);

    // 全リストのデータ
    final dataList = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry',
      'Fig',
      'Grape',
      'Honeydew',
      'Indian Fig',
      'Jackfruit',
      'Kiwi',
      'Lemon',
      'Mango',
      'Nectarine',
      'Orange',
      'Papaya',
      'Quince',
      'Raspberry',
      'Strawberry',
      'Tomato',
      'Ugli Fruit',
      'Vanilla',
      'Watermelon',
      'Xigua',
      'Yellow Passion Fruit',
      'Zucchini',
    ];

    useEffect(() {
      filteredList.value = dataList;
      return null;
    }, []);

    // 検索入力の変更を監視してリストをフィルタリング
    useEffect(() {
      void listener() {
        final query = searchController.text.toLowerCase();
        if (query.isEmpty) {
          filteredList.value = dataList;
        } else {
          filteredList.value = dataList
              .where((item) => item.toLowerCase().contains(query))
              .toList();
        }
      }

      searchController.addListener(listener);

      return () => searchController.removeListener(listener);
    }, [searchController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('リアルタイム検索'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: '検索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredList.value.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredList.value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredList.value[index]),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      '一致する項目がありません。',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}