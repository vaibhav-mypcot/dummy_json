abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccess extends AuthState {
  final int success;
  AuthSuccess(this.success);
}

class AuthErrorState extends AuthState {
  final String? message;
  AuthErrorState(this.message);
}
