part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {}

class ConnectedConnectivityEvent extends ConnectivityEvent {}

class DisconnectConnectivityEvent extends ConnectivityEvent {}
