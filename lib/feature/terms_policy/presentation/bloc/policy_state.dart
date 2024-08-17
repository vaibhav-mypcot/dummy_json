part of 'policy_bloc.dart';

sealed class PolicyState extends Equatable {
  const PolicyState();

  @override
  List<Object> get props => [];
}

final class PolicyInitial extends PolicyState {}

final class PolicyLoadingState extends PolicyState {}

final class PolicyLoadedState extends PolicyState {
  final PolicyModel data;
  const PolicyLoadedState(this.data);
}

final class PolicyFailedState extends PolicyState {
  final String error;
  const PolicyFailedState(this.error);
}
