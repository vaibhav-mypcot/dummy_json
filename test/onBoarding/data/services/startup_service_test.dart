import 'package:dummy_json/feature/onboarding/data/services/startup_services.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/data.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/result.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockApiHelper mockApiHelper;
  late MockHeaderClass mockHeader;
  late StartupServices startupService;
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockApiHelper = MockApiHelper();
    startupService = StartupServices();
    mockHeader = MockHeaderClass();
  });

  test('fetch startup services Success Test', () async {
    final dataModel = Data(result: Result());
    final testModel = StartupModel(
        success: 1, message: "Data fetched successfully.", data: dataModel);
    when(mockApiHelper.callApi<StartupModel>(
      endPoint: 'users/me',
      header: await mockHeader.getHeaders(),
      reqType: 'post',
      fromJsonFunction: StartupModel.fromJson,
    )).thenAnswer((_) async => testModel);

    // Call the function under test
    final result = await startupService.fetchStartup();

    // Verify that the function returns the expected result
    expect(result, isA<StartupModel>());
  });
}
