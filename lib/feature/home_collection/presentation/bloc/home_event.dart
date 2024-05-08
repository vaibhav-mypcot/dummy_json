part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchHomeDataList extends HomeEvent {}

class InternetConnectionFailedEvent extends HomeEvent {}
