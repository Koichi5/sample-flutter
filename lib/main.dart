import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/async_queue/async_queue_sample.dart';
import 'package:sample_flutter/font_sample/font_sample_screen.dart';
import 'package:sample_flutter/font_sample/slack_sample_screen.dart';
import 'package:sample_flutter/spacing/spacing_screen.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        fontFamilyFallback: const ['NotoSans'],
      ),
      home: const AsyncQueueSample(),
    );
  }
}

class WidgetCache<T> extends StatefulWidget {
  const WidgetCache({super.key, required this.value, required this.builder});

  final T value;
  final Widget Function(BuildContext context, T value) builder;

  @override
  WidgetCacheState<T> createState() => WidgetCacheState<T>();
}

class WidgetCacheState<T> extends State<WidgetCache<T>> {
  late Widget cache;
  T? previousValue;

  @override
  Widget build(BuildContext context) {
    if (identical(widget.value, previousValue) == false) {
      previousValue = widget.value;
      cache = Builder(
        builder: (context) => widget.builder(context, widget.value),
      );
    }
    return cache;
  }
}
