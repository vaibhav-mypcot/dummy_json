import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(UnknownState()) {
    final Connectivity connectivity = Connectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((results) {
      for (var result in results) {
        if (result == ConnectivityResult.none) {
          add(DisconnectConnectivityEvent());
        } else {
          add(ConnectedConnectivityEvent());
        }
      }
    });

    checkConnection(connectivity: connectivity);
    on<ConnectivityEvent>(_notifyStatus);
  }

  late StreamSubscription connectivitySubscription;

  void _notifyStatus(ConnectivityEvent event, Emitter<ConnectivityState> emit) {
    if (event is ConnectedConnectivityEvent) {
      emit(ConnectedState());
    } else if (event is DisconnectConnectivityEvent) {
      emit(DisconnectedState());
    } else {
      emit(UnknownState());
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }

  Future<void> checkConnection({required Connectivity connectivity}) async {
    List<ConnectivityResult> result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      add(DisconnectConnectivityEvent());
    } else {
      add(ConnectedConnectivityEvent());
    }
  }
}
