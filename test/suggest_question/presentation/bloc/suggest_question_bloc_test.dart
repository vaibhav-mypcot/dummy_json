import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/data.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/result.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/suggest_question_model.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_bloc.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_event.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  group('SuggestQuestionBloc', () {
    late SuggestQuestionBloc suggestQuestionBloc;
    late MockSuggestQuestionRepository mockSuggestQuestionRepository;

    setUp(() {
      mockSuggestQuestionRepository = MockSuggestQuestionRepository();
      suggestQuestionBloc = SuggestQuestionBloc(
          suggestQuestionRepository: mockSuggestQuestionRepository);
    });

    blocTest<SuggestQuestionBloc, SuggestQuestionState>(
        'emits ManageTextField when AddNewTextFiledEvent is added',
        build: () => suggestQuestionBloc,
        act: (bloc) => bloc.add(AddNewTextFiledEvent([], [])),
        expect: () => [
              isA<ManageTextField>(),
            ]);

    // blocTest<SuggestQuestionBloc, SuggestQuestionState>(
    //     'emits ManageTextField when AddNewTextFiledEvent is added',
    //     build: () => suggestQuestionBloc,
    //     act: (bloc) => bloc.add(DeleteTextFiledEvent(1)),
    //     expect: () => []);

    blocTest<SuggestQuestionBloc, SuggestQuestionState>(
      'emits UserAddressUpdateState when UserAddressUpdateEvent is added.',
      build: () {
        final profileData = SuggestQuestionModel(data: Data(result: Result()));
        when(mockSuggestQuestionRepository.fetchSuggestQuestion('sss', []))
            .thenAnswer((_) async => profileData);
        return suggestQuestionBloc;
      },
      act: (bloc) => bloc.add(SuggestQuestionSubmitEvent('sss', [])),
      expect: () => [
        // isA<ProfileErrorState>(),
        isA<SuggestQuestionSubmit>(),
      ],
    );
  });
}
