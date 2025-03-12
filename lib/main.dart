import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Floatab(
          alignment: Alignment.bottomRight,
          isExpandableTab: true,
          type: 'filled-circle',
          options: [
             {'icon': Icons.abc, 'label': 'Option 1'},
              {'icon': Icons.abc_sharp, 'label': 'Option 2'}
          ],
          backgroundColor: Colors.white
        ),
      ),
    );
  }
}