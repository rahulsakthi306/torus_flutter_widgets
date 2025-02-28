import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/bloc/connectivity_cubit.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/radio_group.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Inputs/button.dart';
import 'package:torus_flutter_widgets/pinin.dart';

import 'material_widgets/widgets/dynamic/Inputs/textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connectivity Monitor',
      home: BlocProvider(
        create: (context) =>
            ConnectivityCubit(Connectivity())..monitorConnectivity(),
        child: ConnectivityStatus(),
      ),
    );
  }
}

class ConnectivityStatus extends StatefulWidget {
  const ConnectivityStatus({super.key});

  @override
  State<ConnectivityStatus> createState() => _ConnectivityStatusState();
}

class _ConnectivityStatusState extends State<ConnectivityStatus> {
  bool switchVal = false;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityResult>(
      listener: (context, connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No internet connection'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   TTextField(
                    keyboardType: TextInputType.text,
                   ),
                   TTextField(
                    keyboardType: TextInputType.text,
                   ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
