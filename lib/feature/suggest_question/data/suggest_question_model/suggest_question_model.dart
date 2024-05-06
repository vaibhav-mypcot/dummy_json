import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';
import 'package:dummy_json/feature/suggest_question/data/suggest_question_model/data.dart';
import 'package:equatable/equatable.dart';

class SuggestQuestionModel extends AbstractModel with EquatableMixin {
  int? success;
  String? message;
  Data? data;

  SuggestQuestionModel({
    this.success,
    this.message,
    this.data,
  });

  // factory SuggestQuestionModel.fromJson(Map<String, dynamic> json) =>
  //   SuggestQuestionModel(
  //     success: json['success'] as int?,
  //     message: (json['message'] as List<dynamic>?)
  //         ?.map<String>((e) => e as String)
  //         .toList(),
  //     data: json['data'] == null
  //         ? null
  //         : Data.fromJson(json['data'] as Map<String, dynamic>),
  //   );

  factory SuggestQuestionModel.fromJson(Map<String, dynamic> json) =>
      SuggestQuestionModel(
        success: json['success'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}
