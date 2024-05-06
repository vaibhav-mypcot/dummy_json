import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetStatus> {
  InternetCubit() : super(InternetStatus(ConnectivityStatus.disconnected));

  void checkConnectivity() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(List<ConnectivityResult> result) {
    if (result == ConnectivityResult.none) {
      emit(InternetStatus(ConnectivityStatus.disconnected));
    } else {
      emit(InternetStatus(ConnectivityStatus.connected));
    }
  }

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  void trackConnectivityChnage() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectivityStatus(result);
    });
  }
}
