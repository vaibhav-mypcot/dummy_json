import 'package:dummy_json/feature/address/data/repository/profile_repository.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  final OnBoardingBloc onBoardingBloc;
  final String green = '\x1B[32m';
  ProfileBloc({
    required this.profileRepository,
    required this.onBoardingBloc,
  }) : super(ProfileInitialState()) {
    on<FetchProfileDataEvent>(__onFetchAllProfileData);
    on<UserAddressUpdateEvent>(_onUpdateAddress);
    on<FetchPincodeEvent>(_onFetchPincode);
    // on<FetchStartupDataEvent>(_listenStartupApi);
  }

  void __onFetchAllProfileData(
      FetchProfileDataEvent event, Emitter<ProfileState> emit) async {
    try {
      if (state is ProfileLoadingState) return;
      print('$green Data is loading state');

      final profile = await profileRepository.fetchProfileData();
      final success = profile.success;
      final result = profile.data?.result;

      final startupServices = await onBoardingBloc
          .onBoardingRepository.startupServices
          .fetchStartup();
      final startupData = startupServices.data;

      emit(ProfileLoadedState(result!, success!, startupData!));
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  void _onUpdateAddress(
      UserAddressUpdateEvent event, Emitter<ProfileState> emit) async {
    try {
      if (state is ProfileLoadingState) return;

      final updateAddress = await profileRepository.updateUserAddressData(
          event.name, event.address, event.pincode);
      final result = updateAddress.data?.result;

      emit(UserAddressUpdate(result!));
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  void _onFetchPincode(
      FetchPincodeEvent event, Emitter<ProfileState> emit) async {
    try {
      if (state is ProfileLoadingState) return;
      final pinCode = await profileRepository.fetchByPincode(event.pincode);
      final result = pinCode.postOffice;

      emit(PincodeUpdateState(result!));
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }
}
