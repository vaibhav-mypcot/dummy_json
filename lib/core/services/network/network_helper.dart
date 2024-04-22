import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity()
        .onConnectivityChanged
        .forEach((List<ConnectivityResult> results) {
      for (var result in results) {
        if (result == ConnectivityResult.none) {
          NetworkBloc().add(NetworkNotify());
        } else {
          NetworkBloc().add(NetworkNotify(isConnected: true));
        }
      }
    });
  }
}
