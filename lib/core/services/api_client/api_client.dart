import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/functions/functions.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:dummy_json/feature/address/data/services/update_address_request_body.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:dummy_json/feature/users/data/users_model/users_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dummy_json/core/utils/header/headers.dart' as head;
part 'api_client.g.dart';

@RestApi(baseUrl: 'http://skyonliners.com/demo/democracy-apis/webservices/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  final header = head.HeaderClass().getHeaders();

  @GET('users')
  Future<UsersModel> getUsers();

  @POST('users/me')
  Future<ProfileModel> getProfileData(
    @Header('Authorization') String basicAuth,
    @Header('Accept-Language') String acceptedLanguages,
    @Header('access-token') String token,
    @Header('platform') String platform,
    @Header('uuid') String uuid,
    @Header('version') String version,
    @Header('Accept') String Accept,
  );

  @POST('users/address/update')
  Future<ProfileModel> updateAddressData(
    @Header('Authorization') String basicAuth,
    @Header('Accept-Language') String acceptedLanguages,
    @Header('access-token') String token,
    @Header('platform') String platform,
    @Header('uuid') String uuid,
    @Header('version') String version,
    @Header('Accept') String Accept,
    @Body() Map<String, dynamic> body,
  );

  @POST('suggest_question')
  Future<SuggestQuestionModel> getSuggestQuestionData(
    @Header('Authorization') String basicAuth,
    @Header('Accept-Language') String acceptedLanguages,
    @Header('access-token') String token,
    @Header('platform') String platform,
    @Header('uuid') String uuid,
    @Header('version') String version,
    @Header('Accept') String Accept,
    @Body() Map<String, dynamic> body,
  );
}
