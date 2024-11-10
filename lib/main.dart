import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/views/hello_world_screen/hello_world_screen.dart';

void main() {
  debugProfileBuildsEnabled = true;
  debugProfileBuildsEnabledUserWidgets = true;
  debugProfileLayoutsEnabled = true;
  debugProfilePaintsEnabled = true;
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
      debugShowCheckedModeBanner: false,
      home: HelloWorldScreen(),
    );
  }
}
