import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class PieChartSample extends StatelessWidget {
  const PieChartSample({super.key});

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Generate random values for the pie chart
  List<PieChartSectionData> _generatePieData() {
    Random random = Random();
    return List.generate(4, (index) {
      double value = random.nextInt(100).toDouble();
      return PieChartSectionData(
        color: getRandomColor(),
        value: value,
        title: value.toStringAsFixed(1),
        radius: 100, 
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 150,  
      height: 100,
      child: PieChart(
        PieChartData(
          sections: _generatePieData(),
          borderData: FlBorderData(show: false),
          sectionsSpace: 1, 
          centerSpaceRadius: 50, 
        ),
      ),
    );
  }
}
