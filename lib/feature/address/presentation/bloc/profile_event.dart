import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class FetchProfileDataEvent extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchStartupDataEvent extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserAddressUpdateEvent extends ProfileEvent {
  final String name;
  final String address;
  final String pincode;
  UserAddressUpdateEvent({
    required this.name,
    required this.address,
    required this.pincode,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchPincodeEvent extends ProfileEvent {
  final String pincode;
  FetchPincodeEvent({required this.pincode});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
