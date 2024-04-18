import 'dart:convert';

import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
const String accessToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

Future<String> authHeader() async {
  String basicAuth =
      'Basic ${base64Encode(utf8.encode('${StringConstants.username}:${StringConstants.password}'))}';
  return basicAuth;
}

Future<void> saveToken() async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString('access_token', accessToken);
}

Future<String?> getToken() async {
  prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}

Future<String> getAppVersion() async {
  PackageInfo? info = await PackageInfo.fromPlatform();
  return info.version.toString();
}
