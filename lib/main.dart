import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/fl_chart/views/fl_chart_bar_chart_sample.dart';
import 'package:sample_flutter/fl_chart/views/fl_chart_line_chart_sample.dart';
import 'package:sample_flutter/fl_chart/views/fl_chart_pie_chart_sample.dart';
import 'package:sample_flutter/fl_chart/views/fl_chart_weater_sample.dart';

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
      home: FlChartWeatherSample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
