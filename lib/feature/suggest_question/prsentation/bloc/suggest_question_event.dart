import 'package:flutter/material.dart';

abstract class SuggestQuestionEvent {}

class AddNewTextFiledEvent extends SuggestQuestionEvent {
  List<Widget> listWidgets;
  List<TextEditingController> textControllers;
  AddNewTextFiledEvent(this.listWidgets, this.textControllers);
}

class DeleteTextFiledEvent extends SuggestQuestionEvent {
  final int index;
  DeleteTextFiledEvent(this.index);
}

class SuggestQuestionSubmitEvent extends SuggestQuestionEvent {
  final String question;
  final List<TextEditingController> textControllers;

  SuggestQuestionSubmitEvent(this.question, this.textControllers);
}
