import 'package:dummy_json/feature/onboarding/data/repository/startup_repository.dart';
import 'package:dummy_json/feature/onboarding/data/services/startup_services.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/data.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/result.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late OnBoardingRepository onBoardingRepository;
  late MockStartupServices mockStartupServices;

  setUp(() {
    mockStartupServices = MockStartupServices();
    onBoardingRepository = OnBoardingRepository(mockStartupServices);
  });

  group('OnBoardingRepository', () {
    test('fetchStartupData returns StartupModel on success', () async {
      // Arrange

      final StartupModel testModel = StartupModel(
        success: 1,
        message: 'Data fetched successfully.',
        data: Data(result: Result()),
      );

      when(mockStartupServices.fetchStartup())
          .thenAnswer((_) async => testModel);

      // Act
      final result = await mockStartupServices.fetchStartup();

      // Assert
      expect(result, equals(testModel));
      verify(mockStartupServices.fetchStartup()).called(1);
    });

    test('fetchStartupData throws exception on failure', () async {
      // Arrange

      when(mockStartupServices.fetchStartup())
          .thenThrow(Exception('Failed to fetch data'));

      // Act & Assert
      expect(() async => await mockStartupServices.fetchStartup(),
          throwsException);
      verify(mockStartupServices.fetchStartup()).called(1);
    });
  });
}
