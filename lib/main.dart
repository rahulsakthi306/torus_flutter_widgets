import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/chart.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Inputs/dateinput.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Inputs/textarea.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Inputs/textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
   List<Map<String, String>> rawData = [
      {"name": "Amrish", "value": "6600"},
      {"name": "Dominic", "value": "4600"},
      {"name": "Parama", "value": "3600"},
      {"name": "Mari", "value": "3600"},
    ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
         TDateInput(
         )
          ],
        ),
      ),
    );
  }
}
