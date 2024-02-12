import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartPirChartSample extends StatelessWidget {
  const FlChartPirChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('円グラフ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: screenWidth * 0.95,
            height: screenWidth * 0.95 * 0.65,
            child: rotatedPieChart()),
      ),
    );
  }

  Widget pieChart() {
    List<Sector> sectors = [
      Sector(color: Colors.red, value: 50, title: 'Red'),
      Sector(color: Colors.blue, value: 30, title: 'Blue'),
      Sector(color: Colors.green, value: 10, title: 'Green'),
      Sector(color: Colors.yellow, value: 5, title: 'Yellow'),
      Sector(color: Colors.purple, value: 3, title: 'Purple'),
      Sector(color: Colors.black, value: 2, title: 'Black'),
    ];

    List<PieChartSectionData> chartSections(List<Sector> sectors) {
      final List<PieChartSectionData> list = [];
      for (var sector in sectors) {
        const double radius = 50.0;
        final data = PieChartSectionData(
          color: sector.color,
          value: sector.value,
          title: sector.title,
          radius: radius,
        );
        list.add(data);
      }
      return list;
    }

    return PieChart(
      PieChartData(
        sections: chartSections(sectors),
        centerSpaceRadius: 48.0,
      ),
    );
  }

  Widget rotatedPieChart() {
    List<Sector> sectors = [
      Sector(color: Colors.red, value: 50, title: 'Red'),
      Sector(color: Colors.blue, value: 30, title: 'Blue'),
      Sector(color: Colors.green, value: 10, title: 'Green'),
      Sector(color: Colors.yellow, value: 5, title: 'Yellow'),
      Sector(color: Colors.purple, value: 3, title: 'Purple'),
      Sector(color: Colors.black, value: 2, title: 'Black'),
    ];

    List<PieChartSectionData> chartSections(List<Sector> sectors) {
      final List<PieChartSectionData> list = [];
      for (var sector in sectors) {
        const double radius = 50.0;
        final data = PieChartSectionData(
          color: sector.color,
          value: sector.value,
          radius: radius,
          showTitle: false,
          badgeWidget: Transform.rotate(
            angle: 90 * pi / 180,
            child: Text(
              sector.title,
            ),
          ),
        );

        list.add(data);
      }
      return list;
    }

    return Transform.rotate(
      angle: -90 * pi / 180,
      child: PieChart(
        PieChartData(
          sections: chartSections(sectors),
          centerSpaceRadius: 48.0,
        ),
      ),
    );
  }
}

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}
