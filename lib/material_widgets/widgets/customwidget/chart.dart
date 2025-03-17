import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<String> chartType =  [ 'line', 'bar', 'pie' ];

class TChart extends StatelessWidget {
  final List<Map<String, String>> rawData;
  final String chartType;

  const TChart({
    super.key,
    required this.rawData,
    required this.chartType,
  });

  List<FlSpot> _getLineChartData() {
    return rawData
        .asMap()
        .map((index, dataItem) => MapEntry(
              index,
              FlSpot(index.toDouble(), double.parse(dataItem["value"]!)),
            ))
        .values
        .toList();
  }

  List<BarChartGroupData> _getBarChartData() {
    return rawData
        .asMap()
        .map(
          (index, dataItem) => MapEntry(
            index,
            BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: double.parse(dataItem["value"]!),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        )
        .values
        .toList();
  }

  List<PieChartSectionData> _getPieChartData() {
    return rawData
        .asMap()
        .map(
          (index, dataItem) => MapEntry(
            index,
            PieChartSectionData(
              value: double.parse(dataItem["value"]!),
              color: Colors.primaries[index % Colors.primaries.length],
              title: '${dataItem["name"]}',
              showTitle: false,
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> lineData = _getLineChartData();
    List<BarChartGroupData> barData = _getBarChartData();
    List<PieChartSectionData> pieData = _getPieChartData();

    switch (chartType) {
      case 'line':
        return _buildLineChart(lineData);
      case 'bar':
        return _buildBarChart(barData);
      case 'pie':
        return _buildPieChart(pieData);
      default:
        return SizedBox();
    }
  }

  Widget _buildLineChart(List<FlSpot> lineData) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: lineData,
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(List<BarChartGroupData> barData) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          barGroups: barData,
        ),
      ),
    );
  }

  Widget _buildPieChart(List<PieChartSectionData> pieData) {
    double totalValue = rawData
        .map((dataItem) => double.parse(dataItem["value"]!))
        .reduce((a, b) => a + b);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 350,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 8.0,
                  sections: pieData,
                  borderData: FlBorderData(show: false),
                ),
              ),
              Text(
                totalValue.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        // Legend
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: List.generate(pieData.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: pieData[index].color,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pieData[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                pieData[index].value.toStringAsFixed(0),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
