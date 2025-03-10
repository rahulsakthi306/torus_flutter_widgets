import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Floatab(),
          
          // child: MyForm(),
        ),
        // floatingActionButton: Floatab(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TTextField(
            label: 'Employee ID',
          )
        ],
      ),
    );
  }
}
