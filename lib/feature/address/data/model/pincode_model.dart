import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';

class PincodeModel extends AbstractModel {
  String? message;
  String? status;
  List<PostOffice>? postOffice;

  PincodeModel({
    this.message,
    this.status,
    this.postOffice,
  });

  factory PincodeModel.fromJson(Map<String, dynamic> json) {
    return PincodeModel(
      message: json["Message"],
      status: json["Status"],
      postOffice: json["PostOffice"] != null
          ? List<PostOffice>.from(
              json["PostOffice"].map((x) => PostOffice.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Message": message,
      "Status": status,
      "PostOffice": postOffice?.map((x) => x.toJson()).toList(),
    };
  }
}

class PostOffice {
  String? name;
  String? description; // Change dynamic to String if it's always a string
  String? branchType;
  String? deliveryStatus;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? block;
  String? state;
  String? country;
  String? pincode;

  PostOffice({
    this.name,
    this.description,
    this.branchType,
    this.deliveryStatus,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.block,
    this.state,
    this.country,
    this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json["Name"],
      description: json["Description"],
      branchType: json["BranchType"],
      deliveryStatus: json["DeliveryStatus"],
      circle: json["Circle"],
      district: json["District"],
      division: json["Division"],
      region: json["Region"],
      block: json["Block"],
      state: json["State"],
      country: json["Country"],
      pincode: json["Pincode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Description": description,
      "BranchType": branchType,
      "DeliveryStatus": deliveryStatus,
      "Circle": circle,
      "District": district,
      "Division": division,
      "Region": region,
      "Block": block,
      "State": state,
      "Country": country,
      "Pincode": pincode,
    };
  }
}
