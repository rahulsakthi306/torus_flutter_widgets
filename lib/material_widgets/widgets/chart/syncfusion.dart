import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Syncfusion extends StatefulWidget {
  const Syncfusion({super.key});

  @override
  State<Syncfusion> createState() => _SyncfusionState();
}

class _SyncfusionState extends State<Syncfusion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart()
      ],
    );
  }
}