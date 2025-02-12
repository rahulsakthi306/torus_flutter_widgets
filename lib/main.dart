import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/bloc/connectivity_cubit.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Image.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/indicator.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/pininput.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/progressbar.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/radio.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/rattingbar.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/switch.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/textarea.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
              TImage(
                size: 'small',
                imageUrl: 'https://th.bing.com/th/id/OIP.940Ryc2jbFKRf0eU0J8Q2QHaHa?rs=1&pid=ImgDetMain',
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
