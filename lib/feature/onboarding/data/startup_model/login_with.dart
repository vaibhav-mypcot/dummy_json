class LoginWith {
  bool? skipLoginAndroid;
  bool? skipLoginIos;
  bool? otp;
  bool? password;
  bool? fb;
  bool? google;
  bool? apple;

  LoginWith({
    this.skipLoginAndroid,
    this.skipLoginIos,
    this.otp,
    this.password,
    this.fb,
    this.google,
    this.apple,
  });

  factory LoginWith.fromJson(Map<String, dynamic> json) => LoginWith(
        skipLoginAndroid: json['skip_login_android'] as bool?,
        skipLoginIos: json['skip_login_ios'] as bool?,
        otp: json['otp'] as bool?,
        password: json['password'] as bool?,
        fb: json['fb'] as bool?,
        google: json['google'] as bool?,
        apple: json['apple'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'skip_login_android': skipLoginAndroid,
        'skip_login_ios': skipLoginIos,
        'otp': otp,
        'password': password,
        'fb': fb,
        'google': google,
        'apple': apple,
      };
}
