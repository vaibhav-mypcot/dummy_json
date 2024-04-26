
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/result.dart';
import 'package:flutter/material.dart';

abstract class SuggestQuestionState  {}

class SuggestQuestionInitialState extends SuggestQuestionState {

}

class ManageTextField extends SuggestQuestionState {
   List<Widget> listWidgets;
   List<TextEditingController> textControllersList;
  ManageTextField(this.listWidgets, this.textControllersList);
}

class QuestionErrorState extends SuggestQuestionState {
  final String? message;
  QuestionErrorState(this.message);
}

class SuggestQuestionSubmit extends SuggestQuestionState {
  final Result result;
  SuggestQuestionSubmit(this.result);
}

