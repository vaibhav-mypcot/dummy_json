import 'package:dummy_json/feature/home_collection/data/home_model/data.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final profileModel = HomeModel(
    data: Data(),
    message: 'Success',
    success: 1,
  );

  test('should be a subclass of profile model', () async {
    expect(profileModel, isA<HomeModel>());
  });
}
