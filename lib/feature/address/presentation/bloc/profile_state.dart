import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';

abstract class ProfileState {}

/// initial, loading, loaded, and error state.

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final Result? result;
  ProfileLoadedState(this.result);
}

class ProfileErrorState extends ProfileState {
  final String? message;
  ProfileErrorState(this.message);
}

class UserAddressUpdate extends ProfileState {
  final Result result;
  UserAddressUpdate(this.result);
}

class PincodeUpdateState extends ProfileState {
  final List<PostOffice> postOffice;
  PincodeUpdateState(this.postOffice);
}
