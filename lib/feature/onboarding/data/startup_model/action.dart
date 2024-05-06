class Action {
  bool? logout;
  bool? login;

  Action({this.logout, this.login});

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        logout: json['logout'] as bool?,
        login: json['login'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'logout': logout,
        'login': login,
      };
}
