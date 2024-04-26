import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';

class ProfileServices {
  ApiHelper apiHelper = ApiHelper();
  // String? token;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  Future<ProfileModel> getProfileData() async {
    try {
      // token = await getToken();
      var header = await Header().getHeaders();
      // var header = await MockHeaderGette().get getHeaders();

      final response = await apiHelper.callApi<ProfileModel>(
          endPoint: 'users/me',
          header: header!,
          reqType: 'post',
          fromJsonFunction: ProfileModel.fromJson);

      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load profile: ${response.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProfileModel> updateUserAddress(
      String name, String address, String pinCode) async {
    try {
      // token = await getToken();
     var header = await Header().getHeaders();

      final response = await apiHelper.callApi<ProfileModel>(
          endPoint: 'users/address/update',
          header: header!,
          reqType: 'post',
          body: {
            "name": name,
            "address": address,
            "pin_code": pinCode,
            "state_name": 'maharashtra',
            "city_name": 'mumbai',
          },
          fromJsonFunction: ProfileModel.fromJson);

      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load profile: ${response.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PincodeModel> getPincode(String pincode) async {
    try {
  var header = await Header().getHeaders();

      final response = await apiHelper.callApi<PincodeModel>(
          endPoint: "${StringConstants.pincode}/$pincode",
          apiUrl: StringConstants.pincodeApiURL,
          header: header!,
          reqType: 'get',
          fromJsonFunction: PincodeModel.fromJson);

      if (response.postOffice != null) {
        return response;
      } else {
        throw Exception('Failed to load profile: ${response.message}');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
