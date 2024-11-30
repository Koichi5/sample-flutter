import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

class UseFutureSample extends HookWidget {
  const UseFutureSample({super.key});

  /// データをフェッチする非同期関数
  Future<List<dynamic>> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('データの取得に失敗しました');
    }
  }

  @override
  Widget build(BuildContext context) {
    // useFuture を使用して非同期データを取得
    final future = useMemoized(() => fetchData());
    final snapshot = useFuture(future, initialData: null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useFuture サンプル'),
      ),
      body: Center(
        child: () {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('エラー: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                );
              },
            );
          } else {
            return const Text('データがありません');
          }
        }(),
      ),
    );
  }
}