class UlasanModel {
  int? id;
  String reviewer;
  int rating;
  String comments;
  DateTime? createdAt;
  DateTime? updatedAt;

  UlasanModel({
    this.id,
    required this.reviewer,
    required this.rating,
    required this.comments,
    this.createdAt,
    this.updatedAt,
  });

  factory UlasanModel.fromJson(Map<String, dynamic> json) {
    return UlasanModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      reviewer: json['reviewer'],
      rating: json['rating'] is int
          ? json['rating']
          : int.tryParse(json['rating'].toString()),
      comments: json['comments'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewer': reviewer,
      'rating': rating,
      'comments': comments,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
