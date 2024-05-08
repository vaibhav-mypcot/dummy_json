import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';

class ValidateOtpModel extends AbstractModel {
  int? success;
  String? message;
  Data? data;

  ValidateOtpModel({
    this.success,
    this.message,
    this.data,
  });

  factory ValidateOtpModel.fromJson(Map<String, dynamic> json) =>
      ValidateOtpModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Result? result;

  Data({
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  int? id;
  String? name;
  String? phoneCode;
  String? phone;
  String? gender;
  dynamic dob;
  dynamic address;
  dynamic cityId;
  dynamic stateId;
  bool? fcmNotification;
  String? rememberToken;
  UpdatedStartupData? updatedStartupData;
  String? userImage;

  Result({
    this.id,
    this.name,
    this.phoneCode,
    this.phone,
    this.gender,
    this.dob,
    this.address,
    this.cityId,
    this.stateId,
    this.fcmNotification,
    this.rememberToken,
    this.updatedStartupData,
    this.userImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        gender: json["gender"],
        dob: json["dob"],
        address: json["address"],
        cityId: json["city_id"],
        stateId: json["state_id"],
        fcmNotification: json["fcm_notification"],
        rememberToken: json["remember_token"],
        updatedStartupData: json["updated_startup_data"] == null
            ? null
            : UpdatedStartupData.fromJson(json["updated_startup_data"]),
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_code": phoneCode,
        "phone": phone,
        "gender": gender,
        "dob": dob,
        "address": address,
        "city_id": cityId,
        "state_id": stateId,
        "fcm_notification": fcmNotification,
        "remember_token": rememberToken,
        "updated_startup_data": updatedStartupData?.toJson(),
        "user_image": userImage,
      };
}

class UpdatedStartupData {
  Home? home;
  UpdatedStartupDataPersonal? personal;
  Profile? profile;
  UpdatedStartupDataOther? other;
  Action? action;

  UpdatedStartupData({
    this.home,
    this.personal,
    this.profile,
    this.other,
    this.action,
  });

  factory UpdatedStartupData.fromJson(Map<String, dynamic> json) =>
      UpdatedStartupData(
        home: json["home"] == null ? null : Home.fromJson(json["home"]),
        personal: json["personal"] == null
            ? null
            : UpdatedStartupDataPersonal.fromJson(json["personal"]),
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        other: json["other"] == null
            ? null
            : UpdatedStartupDataOther.fromJson(json["other"]),
        action: json["action"] == null ? null : Action.fromJson(json["action"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home?.toJson(),
        "personal": personal?.toJson(),
        "profile": profile?.toJson(),
        "other": other?.toJson(),
        "action": action?.toJson(),
      };
}

class Action {
  bool? logout;
  bool? login;

  Action({
    this.logout,
    this.login,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        logout: json["logout"],
        login: json["login"],
      );

  Map<String, dynamic> toJson() => {
        "logout": logout,
        "login": login,
      };
}

class Home {
  bool? recentlyPlayed;
  bool? suggestQuestion;

  Home({
    this.recentlyPlayed,
    this.suggestQuestion,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        recentlyPlayed: json["recently_played"],
        suggestQuestion: json["suggest_question"],
      );

  Map<String, dynamic> toJson() => {
        "recently_played": recentlyPlayed,
        "suggest_question": suggestQuestion,
      };
}

class UpdatedStartupDataOther {
  bool? aboutUs;
  bool? contactUs;
  bool? notificationSetting;
  bool? shareApp;
  bool? faq;
  bool? tnc;
  bool? privacyPolicy;

  UpdatedStartupDataOther({
    this.aboutUs,
    this.contactUs,
    this.notificationSetting,
    this.shareApp,
    this.faq,
    this.tnc,
    this.privacyPolicy,
  });

  factory UpdatedStartupDataOther.fromJson(Map<String, dynamic> json) =>
      UpdatedStartupDataOther(
        aboutUs: json["about_us"],
        contactUs: json["contact_us"],
        notificationSetting: json["notification_setting"],
        shareApp: json["share_app"],
        faq: json["faq"],
        tnc: json["tnc"],
        privacyPolicy: json["privacy_policy"],
      );

  Map<String, dynamic> toJson() => {
        "about_us": aboutUs,
        "contact_us": contactUs,
        "notification_setting": notificationSetting,
        "share_app": shareApp,
        "faq": faq,
        "tnc": tnc,
        "privacy_policy": privacyPolicy,
      };
}

class UpdatedStartupDataPersonal {
  bool? profile;
  bool? enrolledContests;

  UpdatedStartupDataPersonal({
    this.profile,
    this.enrolledContests,
  });

  factory UpdatedStartupDataPersonal.fromJson(Map<String, dynamic> json) =>
      UpdatedStartupDataPersonal(
        profile: json["profile"],
        enrolledContests: json["enrolled_contests"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "enrolled_contests": enrolledContests,
      };
}

class Profile {
  ProfilePersonal? personal;
  ProfileOther? other;

  Profile({
    this.personal,
    this.other,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        personal: json["personal"] == null
            ? null
            : ProfilePersonal.fromJson(json["personal"]),
        other:
            json["other"] == null ? null : ProfileOther.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "personal": personal?.toJson(),
        "other": other?.toJson(),
      };
}

class ProfileOther {
  bool? deleteAccount;
  bool? logout;
  bool? login;

  ProfileOther({
    this.deleteAccount,
    this.logout,
    this.login,
  });

  factory ProfileOther.fromJson(Map<String, dynamic> json) => ProfileOther(
        deleteAccount: json["delete_account"],
        logout: json["logout"],
        login: json["login"],
      );

  Map<String, dynamic> toJson() => {
        "delete_account": deleteAccount,
        "logout": logout,
        "login": login,
      };
}

class ProfilePersonal {
  bool? editProfile;
  bool? addresses;

  ProfilePersonal({
    this.editProfile,
    this.addresses,
  });

  factory ProfilePersonal.fromJson(Map<String, dynamic> json) =>
      ProfilePersonal(
        editProfile: json["edit_profile"],
        addresses: json["addresses"],
      );

  Map<String, dynamic> toJson() => {
        "edit_profile": editProfile,
        "addresses": addresses,
      };
}
