class Result {
  String? type;
  String? title;
  List<dynamic>? collectionData;
  String? bannerImage;

  Result({this.type, this.title, this.collectionData, this.bannerImage});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        type: json['type'] as String?,
        title: json['title'] as String?,
        collectionData: json['collection_data'] as List<dynamic>?,
        bannerImage: json['banner_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'collection_data': collectionData,
        'banner_image': bannerImage,
      };
}
