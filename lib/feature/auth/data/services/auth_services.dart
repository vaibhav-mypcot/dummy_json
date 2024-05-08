import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/services/firebase/firebase_cloud_messaging.dart';
import 'package:dummy_json/core/utils/constants/const.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/auth/data/auth_model/auth_model.dart';

class AuthServices {
  ApiHelper apiHelper = ApiHelper();

  Future<AuthModel> loginUser(String phoneNumber) async {
    try {
      var header = await HeaderClass().getHeaders();
      final response = await apiHelper.callApi<AuthModel>(
          endPoint: Const.login,
          header: header!,
          reqType: 'post',
          body: {
            'phone': phoneNumber,
            'fcm_token': FirebaseCloudMessaging.fcmToken!
          },
          isShowSnackbar: true,
          fromJsonFunction: AuthModel.fromJson);
      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load: ${response.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
