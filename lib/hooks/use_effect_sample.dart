import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UseEffectSample extends HookWidget {
  const UseEffectSample({super.key});

  @override
  Widget build(BuildContext context) {
    final data = useState<List<dynamic>>([]);
    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);
    // useState を使用してフェッチのトリガーとなるカウントを管理
    final fetchTrigger = useState<int>(0);

    // useEffect を使用してデータをフェッチする副作用を設定
    useEffect(() {
      Future<void> fetchData() async {
        isLoading.value = true;
        error.value = null;
        try {
          final response = await http.get(
            Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          );
          if (response.statusCode == 200) {
            data.value = json.decode(response.body);
          } else {
            error.value = 'データの取得に失敗しました: ${response.statusCode}';
          }
        } catch (e) {
          error.value = 'エラーが発生しました: $e';
        } finally {
          isLoading.value = false;
        }
      }

      fetchData();

      return null;
    }, [fetchTrigger.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useEffect Sample'),
      ),
      body: Center(
        child: isLoading.value
            ? const CircularProgressIndicator()
            : error.value != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        error.value!,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // 再取得のトリガー
                          fetchTrigger.value++;
                        },
                        child: const Text('再取得'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.value.length,
                          itemBuilder: (context, index) {
                            final item = data.value[index];
                            return ListTile(
                              title: Text(item['title']),
                              subtitle: Text(item['body']),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // 再取得のトリガー
                          fetchTrigger.value++;
                        },
                        child: const Text('再取得'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
      ),
    );
  }
}
