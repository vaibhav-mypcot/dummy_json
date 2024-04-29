class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json['color'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'color': color,
        'type': type,
      };
}
