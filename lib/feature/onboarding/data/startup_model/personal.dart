class Personal {
  bool? profile;
  bool? enrolledContests;

  Personal({this.profile, this.enrolledContests});

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        profile: json['profile'] as bool?,
        enrolledContests: json['enrolled_contests'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'profile': profile,
        'enrolled_contests': enrolledContests,
      };
}
