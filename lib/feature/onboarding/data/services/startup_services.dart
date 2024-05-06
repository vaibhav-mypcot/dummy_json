import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';

class StartupServices {
  ApiHelper apiHelper = ApiHelper();
  Future<StartupModel> fetchStartup() async {
    try {
      var header = await HeaderClass().getHeaders();

      final response = await apiHelper.callApi<StartupModel>(
          endPoint: StringConstants.startupApi,
          header: header!,
          reqType: 'post',
          fromJsonFunction: StartupModel.fromJson);

      if (response.success == 1) {
        return response;
      } else {
        throw Exception('Failed to load: ${response.message}');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
