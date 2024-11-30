import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseDebouncedSample extends HookWidget {
  const UseDebouncedSample({super.key});

  @override
  Widget build(BuildContext context) {
    // 検索するまでの時間
    const searchDuration = Duration(milliseconds: 800);
    final searchQuery = useState<String>('');
    final searchResult = useState<String>('検索結果がここに表示されます');

    // デバウンスされた検索クエリ
    final debouncedSearchQuery = useDebounced(
      searchQuery.value,
      searchDuration,
    );

    useEffect(() {
      // デバウンスされたクエリに基づいて検索を実行
      if (debouncedSearchQuery != null && debouncedSearchQuery.isNotEmpty) {
        searchResult.value = '$debouncedSearchQuery の検索結果';
      } else {
        searchResult.value = '検索結果がここに表示されます';
      }
      return null;
    }, [debouncedSearchQuery]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useDebounced サンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: '検索',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchQuery.value = value;
              },
            ),
            const SizedBox(height: 20),
            Text(
              searchResult.value,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
