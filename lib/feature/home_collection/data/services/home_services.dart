import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';

class HomeServices {
  ApiHelper apiHelper = ApiHelper();

  Future<HomeModel> fetchHomeList() async {
    try {
      var header = await HeaderClass().getHeaders();
      final response = await apiHelper.callApi<HomeModel>(
          endPoint: 'home/list',
          header: header!,
          reqType: 'post',
          fromJsonFunction: HomeModel.fromJson);

      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load: ${response.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
