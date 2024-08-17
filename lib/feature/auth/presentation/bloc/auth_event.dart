abstract class AuthEvent {}

class AuthUserEvent extends AuthEvent {
  String phoneNumber;
  AuthUserEvent(this.phoneNumber);
}
