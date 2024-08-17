import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';

class ResendOtpModel extends AbstractModel {
  int? success;
  String? message;
  Data? data;

  ResendOtpModel({
    this.success,
    this.message,
    this.data,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) => ResendOtpModel(
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
  String? phone;
  String? name;
  String? otpCode;

  Result({
    this.id,
    this.phone,
    this.name,
    this.otpCode,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        phone: json["phone"],
        name: json["name"],
        otpCode: json["otp_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "name": name,
        "otp_code": otpCode,
      };
}
