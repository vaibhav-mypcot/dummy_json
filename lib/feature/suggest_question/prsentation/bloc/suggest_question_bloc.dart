import 'package:dummy_json/core/common/customTextField.dart';
import 'package:dummy_json/feature/suggest_question/data/repository/suggest_question_repository.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_event.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestQuestionBloc
    extends Bloc<SuggestQuestionEvent, SuggestQuestionState> {
  final SuggestQuestionRepository suggestQuestionRepository;

  SuggestQuestionBloc({required this.suggestQuestionRepository})
      : super(SuggestQuestionInitialState()) {
    on<AddNewTextFiledEvent>(onAddNewTextFiled);
    on<DeleteTextFiledEvent>(onDeleteTextFiledEvent);
    on<SuggestQuestionSubmitEvent>(onSuggestQuestionSubmit);
  }

  void onAddNewTextFiled(
      AddNewTextFiledEvent event, Emitter<SuggestQuestionState> emit) {
    event.listWidgets = event.listWidgets..add(const CustomTextfieldWidget());
    event.textControllers = event.textControllers..add(TextEditingController());

    emit(ManageTextField(event.listWidgets, event.textControllers));
  }

  void onDeleteTextFiledEvent(
      DeleteTextFiledEvent event, Emitter<SuggestQuestionState> emit) {
    ManageTextField currentState = state as ManageTextField;

    currentState.listWidgets = currentState.listWidgets..removeAt(event.index);
    currentState.textControllersList = currentState.textControllersList
      ..removeAt(event.index);

    emit(ManageTextField(
        currentState.listWidgets, currentState.textControllersList));
  }

  void onSuggestQuestionSubmit(SuggestQuestionSubmitEvent event,
      Emitter<SuggestQuestionState> emit) async {
    try {
      final questionData = await suggestQuestionRepository.fetchSuggestQuestion(
          event.question, event.textControllers);
      final result = questionData.data?.result;
      emit(SuggestQuestionSubmit(result!));
    } catch (e) {
      emit(QuestionErrorState(e.toString()));
    }
  }
}
