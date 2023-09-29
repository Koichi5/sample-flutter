import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/async_notifier_screen/async_notifier_screen.dart';
import 'package:sample_flutter/views/family_screen/family_screen.dart';
import 'package:sample_flutter/views/future_screen/future_screen.dart';
import 'package:sample_flutter/views/hello_world_screen/hello_world_screen.dart';
import 'package:sample_flutter/views/notifier_screen/notifier_screen.dart';
import 'package:sample_flutter/views/stream_screen/stream_screen.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FamilyScreen(),
    );
  }
}
