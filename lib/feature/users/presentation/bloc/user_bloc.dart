import 'package:dummy_json/feature/users/data/repository/user_repository.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_event.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({
    required this.userRepository,
  }) : super(UserInitialState()) {
    on<FetchUserDataEvent>(_onFetchUser);
  }

  void _onFetchUser(FetchUserDataEvent event, Emitter<UserState> emit) async {
    try {
      final userdata = await userRepository.fetchUsersData();
      final result = userdata.users;
      emit(ShowUserDataState(result!));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
