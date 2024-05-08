class Result {
  int? id;
  String? phone;
  String? name;

  Result({this.id, this.phone, this.name});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        phone: json['phone'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone': phone,
        'name': name,
      };
}
