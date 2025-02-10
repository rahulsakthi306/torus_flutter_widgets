import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/bloc/connectivity_cubit.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity Monitor',
      home: BlocProvider(
        create: (context) => ConnectivityCubit(Connectivity())..monitorConnectivity(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connectivity'),
      ),
      body: ConnectivityStatus(),
    );
  }
}

class ConnectivityStatus extends StatelessWidget {
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
      child: Center(
        child: ConnectivityText(),
      ),
    );
  }
}

class ConnectivityText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
      builder: (context, connectivityResult) {
        String statusText;
        Color statusColor;

        if (connectivityResult == ConnectivityResult.none) {
          statusText = 'No Internet';
          statusColor = Colors.red;
        } else {
          statusText = 'Connected';
          statusColor = Colors.green;
        }

        return Text(
          statusText,
          style: TextStyle(fontSize: 24, color: statusColor),
        );
      },
    );
  }
}
