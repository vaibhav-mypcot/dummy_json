import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/services/firebase/firebase_cloud_messaging.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/otp/data/validate_otp/validate_otp_model.dart';

class ValidateOtpService {
  ApiHelper apiHelper = ApiHelper();

  Future<ValidateOtpModel> validateOtp(String phoneNumber, String otp) async {
    try {
      var header = await HeaderClass().getHeaders();
      final response = await apiHelper.callApi<ValidateOtpModel>(
          endPoint: Const.validateOtp,
          header: header!,
          reqType: 'post',
          body: {
            'mobile_number': phoneNumber,
            'otp_code': otp,
            'fcm_token': FirebaseCloudMessaging.fcmToken!
          },
          isShowSnackbar: true,
          fromJsonFunction: ValidateOtpModel.fromJson);

      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load data: ${response.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
