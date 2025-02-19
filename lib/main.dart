import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/bloc/connectivity_cubit.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Icon.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/Image.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/card.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/checkbox.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/dateinput.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/datepicker.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/datetimepicker.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/dropdown.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/indicator.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/pininput.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/progressbar.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/radio.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/rattingbar.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/switch.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/textarea.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/textfield.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/dynamic/timepicker.dart';

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
   double columnStart = 1; 
    double columnEnd = 13;

  @override
  Widget build(BuildContext context) {
      double gridWidth = columnEnd - columnStart;
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
            child: ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          md: (gridWidth / 12 * 6).round(), // Medium screens, 50% width (6/12)
          lg: (gridWidth / 12 * 3).round(), // Large screens, 25% width (3/12)
          sm: (gridWidth / 12 * 12).round(), // Small screens, full width (12/12)
          xs: (gridWidth / 12 * 12).round(), // Extra small screens, full width (12/12)
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter something', // From your JSON label
            ),
          ),
        ),
        ResponsiveGridCol(
          md: (gridWidth / 12 * 6).round(), // Medium screens, 50% width (6/12)
          lg: (gridWidth / 12 * 3).round(), // Large screens, 25% width (3/12)
          sm: (gridWidth / 12 * 12).round(), // Small screens, full width (12/12)
          xs: (gridWidth / 12 * 12).round(), // Extra small screens, full width (12/12)
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter something', // From your JSON label
            ),
          ),
        ),
        ResponsiveGridCol(
          md: (gridWidth / 12 * 6).round(), // Medium screens, 50% width (6/12)
          lg: (gridWidth / 12 * 3).round(), // Large screens, 25% width (3/12)
          sm: (gridWidth / 12 * 12).round(), // Small screens, full width (12/12)
          xs: (gridWidth / 12 * 12).round(), // Extra small screens, full width (12/12)
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter something', // From your JSON label
            ),
          ),
        ),
      ],
    ),
          ),
        ),
      ),
    );
  }
}
