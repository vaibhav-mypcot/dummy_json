import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/services/api_client/api_client.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/terms_policy/data/model/policy_model.dart';

class PolicyService {
  ApiHelper apiHelper = ApiHelper();
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  //--- Using retrofit
  final Dio dio;
  PolicyService(this.dio);
  late ApiClient apiClient = ApiClient(dio);

  String basicAuth = authHeader();
  String acceptedLanguages = StringConstants.acceptedLanguage;
  String platform = Platform.operatingSystem;

  Future<PolicyModel> getPolicyData({CancelToken? cancelToken}) async {
    try {
      var header = await HeaderClass().getHeaders();

      final response = await apiHelper.callApi<PolicyModel>(
          endPoint: 'policies',
          header: header!,
          reqType: 'post',
          body: {"type": "policy"},
          cancelToken: cancelToken,
          fromJsonFunction: PolicyModel.fromJson);

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
}
