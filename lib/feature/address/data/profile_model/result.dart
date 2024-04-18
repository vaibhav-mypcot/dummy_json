class Result {
  int? id;
  String? name;
  String? phoneCode;
  String? phone;
  String? gender;
  String? dob;
  String? address;
  String? pinCode;
  String? cityName;
  String? stateName;
  bool? fcmNotification;
  String? userImage;
  String? countryName;

  Result({
    this.id,
    this.name,
    this.phoneCode,
    this.phone,
    this.gender,
    this.dob,
    this.address,
    this.pinCode,
    this.cityName,
    this.stateName,
    this.fcmNotification,
    this.userImage,
    this.countryName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phoneCode: json['phone_code'] as String?,
        phone: json['phone'] as String?,
        gender: json['gender'] as String?,
        dob: json['dob'] as String?,
        address: json['address'] as String?,
        pinCode: json['pin_code'] as String?,
        cityName: json['city_name'] as String?,
        stateName: json['state_name'] as String?,
        fcmNotification: json['fcm_notification'] as bool?,
        userImage: json['user_image'] as String?,
        countryName: json['country_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone_code': phoneCode,
        'phone': phone,
        'gender': gender,
        'dob': dob,
        'address': address,
        'pin_code': pinCode,
        'city_name': cityName,
        'state_name': stateName,
        'fcm_notification': fcmNotification,
        'user_image': userImage,
        'country_name': countryName,
      };
}
