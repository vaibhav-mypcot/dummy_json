import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';
import 'package:equatable/equatable.dart';

import 'data.dart';

class ProfileModel extends AbstractModel with EquatableMixin {
  int? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true; // Enable string conversion for debugging
}
