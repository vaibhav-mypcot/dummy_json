import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/data.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/result.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockOnBoardingRepository mockOnBoardingRepository;
  late OnBoardingBloc onBoardingBloc;

  setUp(() {
    mockOnBoardingRepository = MockOnBoardingRepository();
    onBoardingBloc =
        OnBoardingBloc(onBoardingRepository: mockOnBoardingRepository);
  });

  blocTest<OnBoardingBloc, OnBoardingState>(
    'calls startup api',
    build: () {
      final startupFetch = StartupModel(data: Data(result: Result()));
      when(mockOnBoardingRepository.fetchStartupData())
          .thenAnswer((_) async => startupFetch);
      return onBoardingBloc;
    },
    act: (bloc) => bloc.add(FetchStartUpApiEvent(true)),
    expect: () => [
      // isA<ProfileErrorState>(),
    ],
  );

  blocTest<OnBoardingBloc, OnBoardingState>(
    'emits UpdatedIndexState when NextButtonClickedEvent is added',
    build: () => onBoardingBloc,
    act: (bloc) => bloc.add(NextButtonClickedEvent(2)),
    expect: () => [
      UpdatedIndexState(3),
    ],
  );

  blocTest<OnBoardingBloc, OnBoardingState>(
    'emits UpdatedIndexState when PreviousButtonClickedEvent is added',
    build: () => onBoardingBloc,
    act: (bloc) => bloc.add(NextButtonClickedEvent(2)),
    expect: () => [
      UpdatedIndexState(1),
    ],
  );
}
