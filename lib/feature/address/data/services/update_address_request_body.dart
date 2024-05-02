class UpdateAddressRequestBody {
  final String name;
  final String address;
  final String pinCode;
  final String stateName;
  final String cityName;

  UpdateAddressRequestBody({
    required this.name,
    required this.address,
    required this.pinCode,
    required this.stateName,
    required this.cityName,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "pin_code": pinCode,
      "state_name": stateName,
      "city_name": cityName,
    };
  }
}
