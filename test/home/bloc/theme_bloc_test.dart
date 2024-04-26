import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_block.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_event.dart';
import 'package:dummy_json/feature/home/presentation/theme_bloc/theme_state.dart';
import 'package:test/test.dart';

import '../../helper/hydrated_bloc.dart';


void main() {
  group('ThemeBloc', () {
    // Create a test bloc
    late ThemeBloc bloc;

    // Initialize the mocked storage
    setUp(() {
      initHydratedStorage();
      bloc = ThemeBloc();
    });

    tearDown(() {
      bloc.close();
    });

    // Test initialization
    test('initial state is correct', () {
      expect(bloc.state, ThemeState(false));
    });

    // Test _onThemeToggle method
    blocTest(
      'emits new ThemeState with toggled isDark value when ThemeChangeEvent is added',
      build: () => bloc,
      act: (bloc) => bloc.add(ThemeChangeEvent()),
      expect: () => [ThemeState(true)],
    );
  });
}
