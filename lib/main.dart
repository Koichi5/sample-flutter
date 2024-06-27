import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/sliver_sample/sliver_home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SliverTextFiledHome(),
      // home: SingleChildScrollViewTextFiledHome(),
      // home: ListViewTextFiledHome(),
      // home: ListViewTextFiledHome(),
      // home: SliverToBoxAdapterTextFiledHome(),
      // home: SliverListTextFiledHome(),
      // home: ListViewBuilderTextFiledHome(),
      home: ListViewBuilderTextFiledHome(),
    );
  }
}
