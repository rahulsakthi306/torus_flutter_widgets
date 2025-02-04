import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          child: CustomRadioButton(),
        ),
      ),
    );
  }
}

