import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:dummy_json/feature/address/data/services/profile_service.dart';

class ProfileRepository {
  final ProfileServices profileServices;
  ProfileRepository(this.profileServices);

  Future<ProfileModel> fetchProfileData() async {
    try {
      final profile = await profileServices.getProfileData();
      return profile;
    } catch (e) {
      throw Exception('Failed to fetch profile data: $e');
    }
  }

  Future<ProfileModel> updateUserAddressData(
      String name, String address, String pinCode) async {
    try {
      final userAddress =
          await profileServices.updateUserAddress(name, address, pinCode);
      return userAddress;
    } catch (e) {
      throw Exception('Failed to update user address data: $e');
    }
  }

  Future<PincodeModel> fetchByPincode(String pinCode) async {
    try {
      final pincode = await profileServices.getPincode(pinCode);
      return pincode;
    } catch (e) {
      throw Exception('Failed to update user address data: $e');
    }
  }
}
