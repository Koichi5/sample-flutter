import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartLineChartSample extends StatelessWidget {
  const FlChartLineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('折れ線グラフ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth * 0.95,
          height: screenWidth * 0.95 * 0.65,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(1, 0),
                    FlSpot(2, 400),
                    FlSpot(3, 650),
                    FlSpot(4, 800),
                    FlSpot(5, 870),
                    FlSpot(6, 920),
                    FlSpot(7, 960),
                    FlSpot(8, 980),
                    FlSpot(9, 990),
                    FlSpot(10, 995),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.6),
                        Colors.green.withOpacity(0.6)
                      ],
                    ),
                  ),
                ),
              ],
              titlesData: const FlTitlesData(
                topTitles: AxisTitles(
                  axisNameWidget: Text(
                    "労働の限界生産性",
                  ),
                  axisNameSize: 35.0,
                ),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              maxY: 1000,
              minY: 0,
            ),
          ),
        ),
      ),
    );
  }
}
