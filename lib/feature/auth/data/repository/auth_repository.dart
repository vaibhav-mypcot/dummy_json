import 'package:dummy_json/feature/auth/data/auth_model/auth_model.dart';
import 'package:dummy_json/feature/auth/data/services/auth_services.dart';

class AuthRepository {
  final AuthServices authServices;
  AuthRepository(this.authServices);

  Future<AuthModel> loginUser(String phoneNumber) async {
    try {
      final auth = await authServices.loginUser(phoneNumber);
      return auth;
    } catch (e) {
      throw Exception('Failed to fetch home data: $e');
    }
  }
}
