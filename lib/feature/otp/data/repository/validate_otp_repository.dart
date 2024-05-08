import 'package:dummy_json/feature/otp/data/services/validate_otp_service.dart';
import 'package:dummy_json/feature/otp/data/validate_otp/validate_otp_model.dart';

class ValidateOtpRepository {
  final ValidateOtpService validateOtpService;
  ValidateOtpRepository(this.validateOtpService);

  Future<ValidateOtpModel> validateOTP(String phoneNumber, String otp) async {
    try {
      final validateStatus =
          await validateOtpService.validateOtp(phoneNumber, otp);
      return validateStatus;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
