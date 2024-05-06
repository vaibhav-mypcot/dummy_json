import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkHelper {
  static void observeNetwork() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    Connectivity()
        .onConnectivityChanged
        .forEach((List<ConnectivityResult> results) {
      for (var result in results) {
        if (result == ConnectivityResult.none) {
          NetworkBloc().add(NetworkNotify());
        } else {
          if (isConnected) {
            NetworkBloc().add(NetworkNotify(isConnected: true));
          }
        }
      }
    });
  }
}
