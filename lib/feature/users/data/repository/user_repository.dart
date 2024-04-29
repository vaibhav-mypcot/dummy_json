import 'package:dummy_json/feature/users/data/services/user_services.dart';
import 'package:dummy_json/feature/users/data/users_model/users_model.dart';

class UserRepository {
  final UserServices userServices;
  UserRepository(this.userServices);

  Future<UsersModel> fetchUsersData() async {
    try {
      final userData = await userServices.getUsers();
      return userData;
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
