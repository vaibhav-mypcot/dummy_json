import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';

import 'data.dart';

class HomeModel extends AbstractModel {
  int? success;
  String? message;
  Data? data;

  HomeModel({this.success, this.message, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json['success'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
