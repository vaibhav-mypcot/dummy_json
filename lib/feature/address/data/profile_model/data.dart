import 'result.dart';

class Data {
  Result? result;

  Data({this.result});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json['result'] == null
            ? null
            : Result.fromJson(json['result'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'result': result?.toJson(),
      };
}
