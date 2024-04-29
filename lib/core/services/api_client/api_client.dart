import 'package:dio/dio.dart';
import 'package:dummy_json/feature/users/data/users_model/users_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

  @RestApi(baseUrl: 'https://dummyjson.com/')
  abstract class ApiClient {
    factory ApiClient(Dio dio) = _ApiClient;

    @GET('users')
    Future<UsersModel> getUsers();
  }
