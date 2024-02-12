import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/fl_chart/model/weather.dart';
import 'package:sample_flutter/fl_chart/providers/weather_provider.dart';

class FlChartWeatherSample extends ConsumerWidget {
  const FlChartWeatherSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('気温の折れ線グラフ'),
      ),
      body: weatherAsyncValue.when(
        data: (weather) {
          return TemperatureLineChart(weather: weather);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('エラー: $err')),
      ),
    );
  }
}

class TemperatureLineChart extends StatelessWidget {
  final Weather weather;

  const TemperatureLineChart({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Weather オブジェクトから気温データの FlSpot リストを生成
    List<FlSpot> spots = weather.hourly.temperature_2m
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();

    int minTemperature = weather.hourly.temperature_2m.reduce(min).round();
    int maxTemperature = weather.hourly.temperature_2m.reduce(max).round();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: screenWidth * 0.95,
        height: screenWidth * 0.95 * 0.65,
        child: LineChart(
          LineChartData(
            minY: minTemperature - 5,
            maxY: maxTemperature + 5,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: Colors.blue,
              ),
            ],
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    // 時刻データをX軸のラベルとして表示
                    final dateTimeHour =
                        DateTime.parse(weather.hourly.time[value.toInt()]).hour;
                    return Text(dateTimeHour.toString());
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
