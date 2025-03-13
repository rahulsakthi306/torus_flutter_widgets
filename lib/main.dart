import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/fab.dart';
import 'package:torus_flutter_widgets/pinInput_new.dart';
import 'package:torus_flutter_widgets/pinin.dart';

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
              Row(
                children: [
                  Flexible(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: PinInputCustom()
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
