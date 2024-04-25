import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc
    extends HydratedBloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
      : super(LocalizationState(Locale('en'))) {
    on<LoadLocalization>(changeLanguage);
  }

  void changeLanguage(LoadLocalization event, Emitter<LocalizationState> emit) {
    if (event.locale == state.locale) return;
    emit(LocalizationState(event.locale));
  }

  @override
  LocalizationState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('locale')) {
      final languageCode = json['locale'] as String;
      return LocalizationState(Locale(languageCode));
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LocalizationState state) {
    print('here is your language code : ${state.locale.languageCode}');
    return {'locale': state.locale.languageCode};
  }
}
