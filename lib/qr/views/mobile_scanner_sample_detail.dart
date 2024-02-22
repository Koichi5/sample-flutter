import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_flutter/qr/models/book.dart';

class MobileScannerSampleDetail extends StatelessWidget {
  const MobileScannerSampleDetail({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('本の詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              book.items.first.volumeInfo.imageLinks.thumbnail,
              width: 200,
              height: 300,
            ),
            const Gap(20),
            const Text('タイトル'),
            Text(book.items.first.volumeInfo.title),
            const Gap(20),
            const Text('著者'),
            Column(
              children: book.items.first.volumeInfo.authors.map((auther) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(auther),
                );
              }).toList(),
            ),
            const Gap(20),
            Text('出版社：${book.items.first.volumeInfo.publisher ?? '情報がありません'}'),
            const Gap(20),
            Text('詳細：${book.items.first.volumeInfo.description}'),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
