import 'package:dummy_json/feature/home_collection/data/home_model/result.dart';
import 'package:dummy_json/feature/home_collection/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitialState()) {
    on<FetchHomeDataList>(_onFetchHomeData);
  }

  void _onFetchHomeData(
      FetchHomeDataList event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      final homeList = await homeRepository.fetchHomeData();
      final result = homeList.data!.result!;

      emit(HomeDataSuccess(result));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
