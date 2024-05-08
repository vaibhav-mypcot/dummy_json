abstract class OtpState {}

class OtpInitialState extends OtpState{}

class VerifyLoadingState extends OtpState {}

class VerifySuccessState extends OtpState {
  final int success;
  VerifySuccessState(this.success);
}

class VerifyErrorState extends OtpState {
  final String error;
  VerifyErrorState(this.error);
}