import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileServices {
  ApiHelper apiHelper = ApiHelper();
  // String? token;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  Future<ProfileModel> getProfileData() async {
    try {
      // token = await getToken();
      var header = await getHeaders();

      final response = await apiHelper.callApi<ProfileModel>(
          endPoint: 'users/me',
          header: header!,
          reqType: 'post',
          fromJsonFunction: ProfileModel.fromJson);

      debugPrint("PROFILE MESSAGE : ${response.message.toString()}");
      debugPrint("PROFILE RESPONSE : ${response.data.toString()}");
      debugPrint("PROFILE RESPONSE SUCCESS: ${response.success.toString()}");

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
      var header = await getHeaders();

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
}