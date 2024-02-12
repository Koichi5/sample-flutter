import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartBarChartSample extends StatelessWidget {
  const FlChartBarChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('棒グラフ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth * 0.95,
          height: screenWidth * 0.95 * 0.65,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                ),
              ),
              titlesData: const FlTitlesData(
                topTitles: AxisTitles(
                  axisNameWidget: Text(
                    "正規分布",
                  ),
                  axisNameSize: 35.0,
                ),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              groupsSpace: 10,
              barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(toY: 1, width: 15, color: Colors.blue),
                  BarChartRodData(toY: 10, width: 15, color: Colors.red),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(toY: 20, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(toY: 30, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(toY: 60, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(toY: 90, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(toY: 100, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 7, barRods: [
                  BarChartRodData(toY: 90, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 8, barRods: [
                  BarChartRodData(toY: 60, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 9, barRods: [
                  BarChartRodData(toY: 30, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 10, barRods: [
                  BarChartRodData(toY: 20, width: 15, color: Colors.blue),
                ]),
                BarChartGroupData(x: 11, barRods: [
                  BarChartRodData(toY: 1, width: 15, color: Colors.blue),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
