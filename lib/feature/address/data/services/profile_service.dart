import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/services/api_client/api_client.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';

class ProfileServices {
  ApiHelper apiHelper = ApiHelper();
  //--- Using retrofit
  final Dio dio;
  ProfileServices(this.dio);
  late ApiClient apiClient = ApiClient(dio);

  String basicAuth = authHeader();
  String acceptedLanguages = StringConstants.acceptedLanguage;
  String platform = Platform.operatingSystem;
  String accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  // Future<ProfileModel> getProfile() async {
  //   try {
  //     final response = await apiClient.getProfileData(
  //         basicAuth,
  //         acceptedLanguages,
  //         accessToken,
  //         platform,
  //         StringConstants.uuid,
  //         '1.0.0',
  //         '*/*');
  //     print(response.message.toString());
  //     return response;
  //   } catch (e) {
  //     throw Exception('Failed to get users: $e');
  //   }
  // }

  // String? token;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  Future<ProfileModel> getProfileData() async {
    try {
      // token = await getToken();
      var header = await HeaderClass().getHeaders();
      // var header = await MockHeaderGette().get getHeaders();

      final response = await apiHelper.callApi<ProfileModel>(
          endPoint: 'users/me',
          header: header!,
          reqType: 'post',
       
          fromJsonFunction: ProfileModel.fromJson);

      if (response.success == 1) {
        return response;
      } else if (response.success == 4) {
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
    final Map<String, dynamic> requestBody = {
      "name": name,
      "address": address,
      "pin_code": pinCode,
      "state_name": 'maharashtra',
      "city_name": 'mumbai',
    };
    try {
      final response = await apiClient.updateAddressData(
          basicAuth,
          acceptedLanguages,
          accessToken,
          platform,
          StringConstants.uuid,
          '1.0.0',
          '*/*',
          requestBody);
      print(response.message.toString());
      return response;
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  // Future<ProfileModel> updateUserAddress(
  //     String name, String address, String pinCode) async {
  //   try {
  //     // token = await getToken();
  //     var header = await HeaderClass().getHeaders();

  // final response = await apiHelper.callApi<ProfileModel>(
  //     endPoint: 'users/address/update',
  //     header: header!,
  //     reqType: 'post',
  //     body: {
  //       "name": name,
  //       "address": address,
  //       "pin_code": pinCode,
  //       "state_name": 'maharashtra',
  //       "city_name": 'mumbai',
  //     },
  //     fromJsonFunction: ProfileModel.fromJson);

  //     if (response.success == 1) {
  //       return response;
  //     } else {
  //       throw Exception('Failed to load profile: ${response.message}');
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<PincodeModel> getPincode(String pincode) async {
    try {
      var header = await HeaderClass().getHeaders();

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
