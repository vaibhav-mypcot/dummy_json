abstract class OtpEvent {}

class VerifyOtpEvent extends OtpEvent {
  final String phoneNumber;
  final String otp;
  VerifyOtpEvent(this.phoneNumber, this.otp);
}
