import 'package:dummy_json/feature/onboarding/data/repository/startup_repository.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  // int event.index = 0;
  bool isConnected = false;
  final OnBoardingRepository onBoardingRepository;
  // final NetworkBloc networkBloc;

  OnBoardingBloc({required this.onBoardingRepository})
      : super(OnBoardingInitialState()) {
    on<NextButtonClickedEvent>(_onNextButtonClicked);
    on<PreviousButtonClickedEvent>(_onPreviousButtonClicked);
    on<UpdateIndexEvent>(_onUpdateIndex);
    on<FetchStartUpApiEvent>(_checkNetWorkStatus);
  }

  void _onUpdateIndex(UpdateIndexEvent event, Emitter<OnBoardingState> emit) {
    emit(UpdatedIndexState(event.index));
  }

  void _onNextButtonClicked(
      NextButtonClickedEvent event, Emitter<OnBoardingState> emit) {
    if (event.index != 3) {
      event.index++;

      emit(UpdatedIndexState(event.index));
    } else {
      // Get.toNamed(AppRoutes.loginScreen);
    }
  }

  void _onPreviousButtonClicked(
      PreviousButtonClickedEvent event, Emitter<OnBoardingState> emit) {
    if (event.index != 0) {
      event.index--;
      emit(UpdatedIndexState(event.index));
    } else {
      // Get.toNamed(AppRoutes.loginScreen);
    }
  }

  void _checkNetWorkStatus(
      FetchStartUpApiEvent event, Emitter<OnBoardingState> emit) async {
    if (event.isConnected) {
      print("we can fetch api here");
      try {
        final data = await onBoardingRepository.fetchStartupData();
        String message = data.message.toString();
        final result = data.data!.result;
        if (message.isNotEmpty && message == "Data fetched successfully.") {
          emit(LoadStartupService(result!));
          print("Starup api called successfully");
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    }
  }
}
