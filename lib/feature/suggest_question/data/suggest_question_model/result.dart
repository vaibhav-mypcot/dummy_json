class Result {
  int? userId;
  String? question;
  int? createdBy;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Result({
    this.userId,
    this.question,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["user_id"],
        question: json["question"],
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "question": question,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
