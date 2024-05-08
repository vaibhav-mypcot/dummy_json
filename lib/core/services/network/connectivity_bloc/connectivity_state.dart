part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

class ConnectedState extends ConnectivityState {}

class DisconnectedState extends ConnectivityState {}

class UnknownState extends ConnectivityState {}
