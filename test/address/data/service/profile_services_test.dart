import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/data.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';
import 'package:dummy_json/feature/address/data/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockApiHelper mockApiHelper;
  late MockHeader mockHeader;
  late ProfileServices profileServices;
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockApiHelper = MockApiHelper();
    profileServices = ProfileServices();
    mockHeader = MockHeader();
  });

  test('getProfileData Success Test', () async {
    final dataModel = Data(result: Result());
    final testModel = ProfileModel(
        success: 1, message: "Data fetched successfully.", data: dataModel);
    when(mockApiHelper.callApi<ProfileModel>(
      endPoint: 'users/me',
      header: await mockHeader.getHeaders(),
      reqType: 'post',
      fromJsonFunction: ProfileModel.fromJson,
    )).thenAnswer((_) async => testModel);

    // Call the function under test
    final result = await profileServices.getProfileData();

    // Verify that the function returns the expected result
    expect(result, isA<ProfileModel>());
  });

  test('Update user address Success Test', () async {
    final dataModel = Data(result: Result());
    final testModel = ProfileModel(
        success: 1,
        message: "User address saved successfully.",
        data: dataModel);
    when(mockApiHelper.callApi<ProfileModel>(
            endPoint: 'users/address/update',
            header: await mockHeader.getHeaders(),
            reqType: 'post',
            body: {
              "name": 'vaibhav',
              "address": 'J&K appartment',
              "pin_code": '400055',
              "state_name": 'maharashtra',
              "city_name": 'mumbai',
            },
            fromJsonFunction: ProfileModel.fromJson))
        .thenAnswer((_) async => testModel);

    // Call the function under test
    final result = await profileServices.updateUserAddress(
        'vaibhav', 'J&K appartment', '400055');

    // Verify that the function returns the expected result
    expect(result, isA<ProfileModel>());
  });

  test('Get pincode Success Test', () async {
    final pincodeTestModel = PincodeModel(
        status: "1", message: "Data fetched successfully.", postOffice: []);
    when(mockApiHelper.callApi<PincodeModel>(
      endPoint: "${StringConstants.pincode}/400055",
      apiUrl: StringConstants.pincodeApiURL,
      header: await mockHeader.getHeaders(),
      reqType: 'post',
      fromJsonFunction: PincodeModel.fromJson,
    )).thenAnswer((_) async => pincodeTestModel);

    // Call the function under test
    final result = await profileServices.getPincode('400055');

    // Verify that the function returns the expected result
    expect(result, isA<PincodeModel>());
  });
}
