import 'package:dummy_json/feature/onboarding/data/startup_model/result.dart';

abstract class OnBoardingState {}

class OnBoardingInitialState extends OnBoardingState {}

class UpdatedIndexState extends OnBoardingState {
  final int index;
  UpdatedIndexState(this.index);
}

class ErrorState extends OnBoardingState {
  final String? message;
  ErrorState(this.message);
}

class LoadStartupService extends OnBoardingState {
  final Result result;
  LoadStartupService(this.result);
}
