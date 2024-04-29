import 'package:dio/dio.dart';
import 'package:dummy_json/core/services/api_client/api_client.dart';
import 'package:dummy_json/feature/users/data/users_model/users_model.dart';

class UserServices {
  final Dio dio;
  UserServices(this.dio);
  late ApiClient apiClient = ApiClient(dio);

  @override
  Future<UsersModel> getUsers() async {
    try {
      final response = await apiClient.getUsers();
      return response;
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }
}
