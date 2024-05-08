part of 'home_bloc.dart';

abstract class HomeState {}

// initial, loading, loaded(success), failure(error), internetConnection checker

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String? message;
  HomeErrorState(this.message);
}

class HomeDataSuccess extends HomeState {
  final List<Result> result;
  HomeDataSuccess(this.result);
}

class InternetConnectionFailedState extends HomeState {}
