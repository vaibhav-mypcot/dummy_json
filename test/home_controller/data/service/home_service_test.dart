import 'package:dummy_json/feature/home_collection/data/home_model/data.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/result.dart';
import 'package:dummy_json/feature/home_collection/data/services/home_services.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockApiHelper mockApiHelper;
  late MockHeaderClass mockHeader;
  late HomeServices homeServices;
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockApiHelper = MockApiHelper();
    homeServices = HomeServices();
    mockHeader = MockHeaderClass();
  });

  test('fetch startup services Success Test', () async {
    final dataModel = Data(result: []);
    final testModel = HomeModel(
        success: 1, message: "Data fetched successfully.", data: dataModel);
    when(mockApiHelper.callApi<HomeModel>(
      endPoint: 'users/me',
      header: await mockHeader.getHeaders(),
      reqType: 'post',
      fromJsonFunction: HomeModel.fromJson,
    )).thenAnswer((_) async => testModel);

    // Call the function under test
    final result = await homeServices.fetchHomeList();

    // Verify that the function returns the expected result
    expect(result, isA<HomeModel>());
  });
}
