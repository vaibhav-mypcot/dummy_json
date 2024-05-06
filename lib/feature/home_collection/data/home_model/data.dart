import 'result.dart';

class Data {
  List<Result>? result;

  Data({this.result});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
