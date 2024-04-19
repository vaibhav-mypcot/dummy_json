import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    ApiHelper,
    Header,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
