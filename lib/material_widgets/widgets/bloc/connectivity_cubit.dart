import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc/bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity;

  ConnectivityCubit(this._connectivity) : super(ConnectivityResult.none);

  void monitorConnectivity() {
    _connectivity.onConnectivityChanged.listen((connectivityResult ) {
      emit(connectivityResult[0]);
    });
  }
}


