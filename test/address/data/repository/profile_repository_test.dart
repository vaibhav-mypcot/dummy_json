import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:dummy_json/feature/address/data/repository/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  group('ProfileRepository', () {
    late ProfileRepository profileRepository;
    late MockProfileServices mockProfileServices;

    setUp(() {
      mockProfileServices = MockProfileServices();
      profileRepository = ProfileRepository(mockProfileServices);
    });

    test('fetchProfileData - Success', () async {
      // Mocking the behavior of getProfileData method in ProfileServices
      final profileData = ProfileModel(); // Create a sample ProfileModel object
      when(mockProfileServices.getProfileData())
          .thenAnswer((_) async => profileData);

      // Call the method under test
      final result = await profileRepository.fetchProfileData();

      // Verify that the correct method was called in the ProfileServices
      verify(mockProfileServices.getProfileData());

      // Verify that the result is as expected
      expect(result, profileData);
    });

    test('updateUserAddressData - Success', () async {
      // Mocking the behavior of updateUserAddress method in ProfileServices
      final userAddress = ProfileModel(); // Create a sample ProfileModel object
      when(mockProfileServices.updateUserAddress(any, any, any))
          .thenAnswer((_) async => userAddress);

      // Call the method under test
      final result = await profileRepository.updateUserAddressData(
          'John Doe', '123 Main St', '12345');

      // Verify that the correct method was called in the ProfileServices
      verify(mockProfileServices.updateUserAddress(
          'John Doe', '123 Main St', '12345'));

      // Verify that the result is as expected
      expect(result, userAddress);
    });

    test('fetchByPincode - Success', () async {
      // Mocking the behavior of getPincode method in ProfileServices
      final pincodeData = PincodeModel(); // Create a sample PincodeModel object
      when(mockProfileServices.getPincode(any))
          .thenAnswer((_) async => pincodeData);

      // Call the method under test
      final result = await profileRepository.fetchByPincode('12345');

      // Verify that the correct method was called in the ProfileServices
      verify(mockProfileServices.getPincode('12345'));

      // Verify that the result is as expected
      expect(result, pincodeData);
    });
  });
}
