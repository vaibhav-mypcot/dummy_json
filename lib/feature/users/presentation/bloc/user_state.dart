import 'package:dummy_json/feature/users/data/users_model/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class ShowUserDataState extends UserState{
  final List<User> user;
  ShowUserDataState(this.user);
}

class UserErrorState extends UserState {
  final String? message;
  UserErrorState(this.message);
}
