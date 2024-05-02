import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {}

/// initial, loading, loaded, and error state.

class ProfileInitialState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProfileLoadedState extends ProfileState {
  final Result? result;
  ProfileLoadedState(this.result);

  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class ProfileErrorState extends ProfileState {
  final String? message;
  ProfileErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class UserAddressUpdate extends ProfileState {
  final Result result;
  UserAddressUpdate(this.result);

  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class PincodeUpdateState extends ProfileState {
  final List<PostOffice> postOffice;
  PincodeUpdateState(this.postOffice);

  @override
  // TODO: implement props
  List<Object?> get props => [postOffice];
}
