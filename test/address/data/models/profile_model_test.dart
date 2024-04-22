import 'package:dummy_json/feature/address/data/profile_model/data.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final profileModel = ProfileModel(
    data: Data(),
    message: 'Success',
    success: 1,
  );

  test('should be a subclass of profile model', () async {
    expect(profileModel, isA<ProfileModel>());
  });
}
