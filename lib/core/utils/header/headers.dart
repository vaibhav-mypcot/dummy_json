import 'dart:io';
import 'dart:math';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:flutter/foundation.dart';

class Header {
  String generateBoundary() {
    final random = Random();
    final codeUnits = List.generate(16, (index) {
      return random.nextInt(33) + 89; // ASCII printable characters
    });

    return String.fromCharCodes(codeUnits);
  }

  String accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  Future<Map<String, String>>? getHeaders() async {
    String basicAuth = await authHeader();
    String? token = accessToken;
    String acceptedLanguages = StringConstants.acceptedLanguage;
    String platform = Platform.operatingSystem;
    // String applicationVersion = await getAppVersion();

    // debugPrint("App Version: blalalala alamal alam: $applicationVersion");
    debugPrint("Access Token: $token");

    Map<String, String> header = {
      'authorization': basicAuth,
      'Accept-Language': acceptedLanguages,
      'access-token': token ?? "",
      'platform': platform,
      'uuid': StringConstants.uuid,
      'version': "1.0.0",
      // 'Content-Type': "multipart/form-data; boundary=xxx",
      'Accept': "*/*"
    };

    return header;
  }
}
