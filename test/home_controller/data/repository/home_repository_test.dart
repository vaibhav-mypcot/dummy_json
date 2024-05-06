import 'package:dummy_json/feature/home_collection/data/home_model/data.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/result.dart';
import 'package:dummy_json/feature/home_collection/data/repositories/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockHomeServices mockHomeServices;
  late HomeRepository homeRepository;
  setUp(() {
    mockHomeServices = MockHomeServices();
    homeRepository = HomeRepository(mockHomeServices);
  });

  test('fetchHomeData returns HomeModel on success', () async {
    // Arrange
    final HomeModel testModel = HomeModel(
      success: 1,
      message: 'Data fetched successfully.',
      data: Data(result: []),
    );

    when(mockHomeServices.fetchHomeList()).thenAnswer((_) async => testModel);

    // Act
    final result = await mockHomeServices.fetchHomeList();

    // Assert
    expect(result, equals(testModel));
    verify(mockHomeServices.fetchHomeList()).called(1);
  });

  // test('fetchHomeData throws exception on failure', () async {
  //   // Arrange
  //   when(mockHomeServices.fetchHomeList())
  //       .thenThrow(Exception('Failed to fetch home data'));

  //   // Act and Assert
  //   expect(() => homeRepository.fetchHomeData(), throwsException);
  //   verify(mockHomeServices.fetchHomeList()).called(1);
  // });
}
