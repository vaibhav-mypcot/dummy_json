import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/data.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final profileModel = SuggestQuestionModel(
    data: Data(),
    message: 'Success',
    success: 1,
  );

  test('should be a subclass of profile model', () async {
    expect(profileModel, isA<SuggestQuestionModel>());
  });
}
