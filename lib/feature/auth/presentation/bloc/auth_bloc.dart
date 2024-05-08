import 'package:dummy_json/feature/auth/data/repository/auth_repository.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_event.dart';
import 'package:dummy_json/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthUserEvent>(_onAuthUser);
  }

  void _onAuthUser(AuthUserEvent event, Emitter<AuthState> emit) async {
    if (state is AuthLoadingState) return;

    try {
      final loginStatus = await authRepository.loginUser(event.phoneNumber);
      print('success');
      emit(AuthSuccess(loginStatus.success!));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
