import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_json/feature/home/presentation/localization_bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helper/hydrated_bloc.dart';

void main() {
  group('LocalizationBloc', () {
    // Define test locales
    final initialLocale = Locale('en');
    final testLocale = Locale('fr');

    // Create a test bloc
    late LocalizationBloc bloc;

    // Initialize the mocked storage
    setUp(() {
      initHydratedStorage();
      bloc = LocalizationBloc();
    });

    tearDown(() {
      bloc.close();
    });

    // Test initialization
    test('initial state is correct', () {
      expect(bloc.state, LocalizationState(initialLocale));
    });

    // Test changeLanguage method
    blocTest(
      'emits new LocalizationState with the new locale when LoadLocalization event is added',
      build: () => bloc,
      act: (bloc) => bloc.add(LoadLocalization(testLocale)),
      expect: () => [LocalizationState(testLocale)],
    );
  });
}
