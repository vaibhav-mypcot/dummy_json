import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/services/api_client/api_client.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:flutter/material.dart';

class SuggestQuestionService {
  ApiHelper apiHelper = ApiHelper();
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9za3lvbmxpbmVycy5jb21cL2RlbW9cL2RlbW9jcmFjeS1hcGlzXC93ZWJzZXJ2aWNlc1wvdjFcL3ZhbGlkYXRlX290cCIsImlhdCI6MTcwNjg1ODUxMSwiZXhwIjoxNzIyNTgzMzExLCJuYmYiOjE3MDY4NTg1MTEsImp0aSI6IlE4bE5xNkN4Z1pjc0diNngiLCJzdWIiOjczLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.-QTKvI5yuhwkYYbe0RQ-LsK2_j8RBNUPAJYAeUD5W2g';

  //--- Using retrofit
  final Dio dio;
  SuggestQuestionService(this.dio);
  late ApiClient apiClient = ApiClient(dio);

  String basicAuth = authHeader();
  String acceptedLanguages = StringConstants.acceptedLanguage;
  String platform = Platform.operatingSystem;

  Future<SuggestQuestionModel> getSuggestQuestionData(
      String question, List<TextEditingController> textControllers) async {
    // ---------body----------- //
    Map<String, dynamic> requestBody = {
      'question': question,
    };
    print('Text controllers length: ${textControllers.length}');
    for (int i = 0; i < textControllers.length; i++) {
      print('Text controller $i value: ${textControllers[i].text}');
      requestBody['option[$i]'] = textControllers[i].text;
    }

    print(requestBody);
    try {
      final response = await apiClient.getSuggestQuestionData(
        basicAuth,
        acceptedLanguages,
        accessToken,
        platform,
        StringConstants.uuid,
        '1.0.0',
        '*/*',
        requestBody,
      );
      print(response.message.toString());
      return response;
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  // Future<SuggestQuestionModel> getSuggestQuestionData(
  //     String question, List<TextEditingController> textControllers) async {
  //   // ---------body----------- //
  //   Map<String, dynamic> requestBody = {
  //     'question': question,
  //   };

  //   for (int i = 0; i < textControllers.length; i++) {
  //     requestBody['option[$i]'] = textControllers[i].text;
  //   }

  //   try {
  //     var header = await HeaderClass().getHeaders();
  //     final response = await apiHelper.callApi<SuggestQuestionModel>(
  //         endPoint: 'suggest_question',
  //         header: header!,
  //         reqType: 'post',
  //         body: requestBody,
  //         fromJsonFunction: SuggestQuestionModel.fromJson);

  //     if (response.success == 1) {
  //       return response;
  //     } else {
  //       throw Exception('Failed to load data: ${response.message}');
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
