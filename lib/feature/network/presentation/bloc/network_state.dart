part of 'network_bloc.dart';

abstract class NetworkState {}

final class NetworkInitial extends NetworkState {}

class NetworkSuccess extends NetworkState {}

class NetworkFailure extends NetworkState {}
