import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  bool isDark;
  ThemeState(this.isDark);

  @override
  List<Object> get props => [isDark];
}

// class ThemeInitialState extends ThemeState {}

// class ThemeChangeState extends ThemeState {}
