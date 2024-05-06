class Other {
  bool? deleteAccount;
  bool? logout;
  bool? login;

  Other({this.deleteAccount, this.logout, this.login});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        deleteAccount: json['delete_account'] as bool?,
        logout: json['logout'] as bool?,
        login: json['login'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'delete_account': deleteAccount,
        'logout': logout,
        'login': login,
      };
}
