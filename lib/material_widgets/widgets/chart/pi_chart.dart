import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PiChart extends StatefulWidget {
  const PiChart({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<PiChart> {
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
    "Ionic": "Ionic legend",
  };

  // final colorList = <Color>[
  //   const Color(0xfffdcb6e),
  //   const Color(0xff0984e3),
  //   const Color(0xfffd79a8),
  //   const Color(0xffe17055),
  //   const Color(0xff6c5ce7),
  // ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  final ChartType? _chartType = ChartType.ring;
  final bool _showCenterText = true;
  final bool _showCenterWidget = true;
  final double _ringStrokeWidth = 32;
  final double? _chartLegendSpacing = 32;

  final bool _showLegendsInRow = false;
  final bool _showLegends = true;
  final bool _showLegendLabel = false;

  final bool _showChartValueBackground = true;
  final bool _showChartValues = true;
  final bool _showChartValuesInPercentage = false;
  final bool _showChartValuesOutside = false;

  final bool _showGradientColors = false;

  final LegendPosition _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    return  Center(
      
          child: PieChart(
            key: ValueKey(key),
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: _chartLegendSpacing!,
            // chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
            // colorList: colorList,
            // initialAngleInDegree: 0,
            chartType: _chartType!,
            // centerText: _showCenterText ? "HYBRID" : null,
            centerWidget: _showCenterWidget
                ? Container(
                  // color: Colors.amber, 
                  child: const Text("Center"))
                : null,
            legendLabels: _showLegendLabel ? legendLabels : {},
            legendOptions: LegendOptions(
              showLegendsInRow: _showLegendsInRow,
              legendPosition: _legendPosition,
              showLegends: _showLegends,
              legendShape: BoxShape.circle,
              legendTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: _showChartValueBackground,
              showChartValues: _showChartValues,
              showChartValuesInPercentage: _showChartValuesInPercentage,
              showChartValuesOutside: _showChartValuesOutside,
            ),
            ringStrokeWidth: _ringStrokeWidth,
            emptyColor: Colors.grey,
            gradientList: _showGradientColors ? gradientList : null,
            emptyColorGradient: const [
              Color(0xff6c5ce7),
              Colors.blue,
            ],
            baseChartColor: Colors.black,
          ),
        );
   
  }
}
