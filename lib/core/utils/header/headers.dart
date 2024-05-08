import 'dart:io';
import 'dart:math';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:flutter/foundation.dart';

class HeaderClass {
  String generateBoundary() {
    final random = Random();
    final codeUnits = List.generate(16, (index) {
      return random.nextInt(33) + 89; // ASCII printable characters
    });

    return String.fromCharCodes(codeUnits);
  }

  String accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcxNTE2MjI0NiwiZXhwIjoxNzMwODg3MDQ2LCJuYmYiOjE3MTUxNjIyNDYsImp0aSI6ImpRdlFaUUtQeHR6Rnp4bHEiLCJzdWIiOjUsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.vaRkEmXFrEqP5NPEr2h2gY4nY3bZQAXe7Kf2luX8uJA';

  Future<Map<String, dynamic>>? getHeaders() async {
    String basicAuth = authHeader();
    String? token = accessToken;
    String acceptedLanguages = StringConstants.acceptedLanguage;
    String platform = Platform.operatingSystem;
    // String applicationVersion = await getAppVersion();

    // debugPrint("App Version: blalalala alamal alam: $applicationVersion");
    debugPrint("Access Token: $token");

    Map<String, dynamic> header = {
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
