import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/avatar.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/button.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/datepicker.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/dropdown.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/pininput.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/textfield.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/timepicker.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/enums/enums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue[200],
          useMaterial3: true,
          indicatorColor: Colors.black),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              TBUtton(
                variant: 'primary',
                label: 'Submit',
                enableSpinner: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> type = [
  'elevated-circle',
  'filled-circle',
  'outlined-circle',
  'icon-circle',
  'elevated-square',
  'filled-square',
  'outlined-square',
  'icon-square',
  'tonal',
  'underlined-circle',
  'underlined-square',
];

