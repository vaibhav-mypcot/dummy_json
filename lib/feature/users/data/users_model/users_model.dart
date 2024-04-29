import 'user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  UsersModel({this.users, this.total, this.skip, this.limit});

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
