import 'package:dummy_json/feature/onboarding/data/startup_model/data.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final profileModel = StartupModel(
    data: Data(),
    message: 'Success',
    success: 1,
  );

  test('should be a subclass of profile model', () async {
    expect(profileModel, isA<StartupModel>());
  });
}
