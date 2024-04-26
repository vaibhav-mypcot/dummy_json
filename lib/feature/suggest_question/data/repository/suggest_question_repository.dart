import 'package:dummy_json/feature/suggest_question/data/services/suggest_question_service.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:flutter/material.dart';

class SuggestQuestionRepository {
  final SuggestQuestionService suggestQuestionService;
  SuggestQuestionRepository(this.suggestQuestionService);

  Future<SuggestQuestionModel> fetchSuggestQuestion(
      String question, List<TextEditingController> textControllers) async {
    try {
      final suggestQuestionData = await suggestQuestionService
          .getSuggestQuestionData(question, textControllers);
      return suggestQuestionData;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
