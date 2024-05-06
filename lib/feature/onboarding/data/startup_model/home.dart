class Home {
  bool? recentlyPlayed;
  bool? suggestQuestion;

  Home({this.recentlyPlayed, this.suggestQuestion});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        recentlyPlayed: json['recently_played'] as bool?,
        suggestQuestion: json['suggest_question'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'recently_played': recentlyPlayed,
        'suggest_question': suggestQuestion,
      };
}
