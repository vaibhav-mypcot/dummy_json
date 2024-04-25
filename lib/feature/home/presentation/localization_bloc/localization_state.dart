part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  final Locale locale;

  LocalizationState(
    this.locale,
  );

  @override
  List<Object> get props => [locale];
}

// class ThemeState extends Equatable {
//   final ThemeData themeData;

//   const ThemeState(this.themeData);

//   @override
//   List<Object> get props => [themeData];
// }
