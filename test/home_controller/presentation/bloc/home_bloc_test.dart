import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/data.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';
import 'package:dummy_json/feature/home_collection/presentation/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late HomeBloc homeBloc;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    homeBloc = HomeBloc(homeRepository: mockHomeRepository);
  });

  blocTest<HomeBloc, HomeState>(
    'emits HomeDataSuccess when FetchHomeDataList added',
    build: () {
      final startupFetch = HomeModel(data: Data(result: []));
      when(mockHomeRepository.fetchHomeData())
          .thenAnswer((_) async => startupFetch);
      return homeBloc;
    },
    act: (bloc) => bloc.add(FetchHomeDataList()),
    expect: () => [
      isA<HomeLoadingState>(),
      isA<HomeDataSuccess>(),
    ],
  );
}
