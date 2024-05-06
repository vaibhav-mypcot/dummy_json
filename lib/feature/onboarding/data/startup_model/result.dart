import 'login_with.dart';
import 'screens.dart';

class Result {
  Screens? screens;
  LoginWith? loginWith;
  bool? mandatoryUpdate;
  String? redirectionUrl;

  Result({
    this.screens,
    this.loginWith,
    this.mandatoryUpdate,
    this.redirectionUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        screens: json['screens'] == null
            ? null
            : Screens.fromJson(json['screens'] as Map<String, dynamic>),
        loginWith: json['login_with'] == null
            ? null
            : LoginWith.fromJson(json['login_with'] as Map<String, dynamic>),
        mandatoryUpdate: json['mandatory_update'] as bool?,
        redirectionUrl: json['redirection_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'screens': screens?.toJson(),
        'login_with': loginWith?.toJson(),
        'mandatory_update': mandatoryUpdate,
        'redirection_url': redirectionUrl,
      };
}
