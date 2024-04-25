import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_event.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeBloc extends HydratedBloc<ThemeChangeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(false)) {
    on<ThemeChangeEvent>(_onThemeToggle);
  }

  void _onThemeToggle(ThemeChangeEvent event, Emitter<ThemeState> emit) {
    state.isDark = !state.isDark;
    print(state.isDark);
    emit(ThemeState(state.isDark));
  }
  
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
   if(json.containsKey('isDark')) {
    final isDark = json['isDark'] as bool;
    return ThemeState(isDark);
   }
  }
  
  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isDark' : state.isDark};
  }
}
