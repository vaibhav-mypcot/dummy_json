import 'package:dummy_json/feature/suggest_question/data/services/suggest_question_service.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/data.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/result.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockApiHelper mockApiHelper;
  late MockHeader mockHeader;
  late SuggestQuestionService suggestQuestionService;
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockApiHelper = MockApiHelper();
    suggestQuestionService = SuggestQuestionService();
    mockHeader = MockHeader();
  });

  test('get suggest question submit success', () async {
    final dataModel = Data(result: Result());
    final testModel = SuggestQuestionModel(
      success: 1,
      message: "Data fetched successfully.",
      data: dataModel,
    );

    // Define options as a list
    final List<dynamic> options = [
      "Answer 1",
      "Answer 2",
      "Answer 3",
      "Answer 4",
    ];

    when(mockApiHelper.callApi<SuggestQuestionModel>(
      endPoint: 'suggest_question', // Assuming correct endpoint
      header: await mockHeader.getHeaders(),
      reqType: 'post',
      // Pass options as a list
      body: {
        "question": "Who are yousadfasdffasd?",
        "option": options,
      },
      fromJsonFunction: SuggestQuestionModel.fromJson,
    )).thenAnswer((_) async => testModel);

    // Call the function under test
    final result = await suggestQuestionService.getSuggestQuestionData(
      'Who are yousadfasdffasd?',
      <TextEditingController>[],
    );

    // Verify that the function returns the expected result
    expect(result, isA<SuggestQuestionModel>());
  });
}
