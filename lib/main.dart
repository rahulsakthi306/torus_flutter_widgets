import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/chart/pi_chart.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/fab.dart';
import 'package:torus_flutter_widgets/pinInput_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           PiChart(),
            ],
          ),
        ),
       
      ),
    );
  }
}
