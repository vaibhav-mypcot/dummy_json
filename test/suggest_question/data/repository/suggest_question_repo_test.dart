import 'package:dummy_json/feature/suggest_question/data/repository/suggest_question_repository.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/data.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/result.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  group('SuggestQuestionRepository', () {
    late SuggestQuestionRepository suggestQuestionRepository;
    late MockSuggestQuestionService mockSuggestQuestionService;

    setUp(() {
      // Initialize the mock SuggestQuestionService and the SuggestQuestionRepository
      mockSuggestQuestionService = MockSuggestQuestionService();
      suggestQuestionRepository =
          SuggestQuestionRepository(mockSuggestQuestionService);
    });

    test('fetchSuggestQuestion returns SuggestQuestionModel', () async {
      // Arrange
      final String question = 'Sample question';
      final List<TextEditingController> textControllers =
          []; // Add any necessary mock data

      final SuggestQuestionModel testModel = SuggestQuestionModel(
        success: 1,
        message: 'Data fetched successfully.',
        data: Data(result: Result()),
      );

      // Mock the getSuggestQuestionData method to return the test model
      when(mockSuggestQuestionService.getSuggestQuestionData(
              question, textControllers))
          .thenAnswer((_) async => testModel);

      // Act
      final result = await suggestQuestionRepository.fetchSuggestQuestion(
          question, textControllers);

      // Assert
      expect(result, equals(testModel));
    });

    test('fetchSuggestQuestion throws Exception on error', () async {
      // Arrange
      final String question = 'Sample question';
      final List<TextEditingController> textControllers =
          []; // Add any necessary mock data

      // Mock the getSuggestQuestionData method to throw an error
      when(mockSuggestQuestionService.getSuggestQuestionData(
              question, textControllers))
          .thenThrow(Exception('Failed to fetch data'));

      // Act and Assert
      expect(
          () => suggestQuestionRepository.fetchSuggestQuestion(
              question, textControllers),
          throwsException);
    });
  });
}
