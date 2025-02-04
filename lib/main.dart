import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/radio.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/testarea.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/timeinput.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
         appBar: AppBar(
          title: Text('Custom Switch Example'),
        ),
        body: Center(
          child: TTextArea(),
          // child: CustomRadioButton(
          //   onChanged: (int? value) {
          //                   setState(() {
          //                     selectedIndex = value!;
          //                     print(value);
          //                   });
          //                 },
          // ),
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

