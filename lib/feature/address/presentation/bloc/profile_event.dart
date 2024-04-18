abstract class ProfileEvent {}

class FetchProfileDataEvent extends ProfileEvent {}

class UserAddressUpdateEvent extends ProfileEvent {
  final String name;
  final String address;
  final String pincode;
  UserAddressUpdateEvent({
    required this.name,
    required this.address,
    required this.pincode,
  });
}
