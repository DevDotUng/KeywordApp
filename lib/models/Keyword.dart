class Keyword {
  Keyword({
    required this.id,
    required this.keyword,
    required this.category,
  });

  int id;
  String keyword;
  String category;

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'] as int,
      keyword: json['keyword'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'keyword': keyword,
        'category': category,
      };
}
