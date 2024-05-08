import 'dart:async';

import 'package:dummy_json/core/services/network/connectivity_bloc/connectivity_bloc.dart';
import 'package:dummy_json/feature/home_collection/data/home_model/result.dart';
import 'package:dummy_json/feature/home_collection/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final ConnectivityBloc connectivityBloc;
  late StreamSubscription connectivitySubscription;
  HomeBloc({
    required this.homeRepository,
    required this.connectivityBloc,
  }) : super(HomeInitialState()) {
    ///start listening to the connectivity bloc
    listenToConnectivityBloc();
    on<FetchHomeDataList>(_onFetchHomeData);
  }

  void _onFetchHomeData(
      FetchHomeDataList event, Emitter<HomeState> emit) async {
    try {
      if (state is HomeLoadingState) return;

      final homeList = await homeRepository.fetchHomeData();
      final result = homeList.data!.result!;

      emit(HomeDataSuccess(result));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }

  void listenToConnectivityBloc() {
    connectivitySubscription = connectivityBloc.stream.listen((state) {
      if (state is DisconnectedState) {
        add(InternetConnectionFailedEvent());
      } else {
        add(FetchHomeDataList());
      }
    });
  }
}
