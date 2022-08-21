import 'package:keyword/models/Keyword.dart';

class PointWithKeyword {
  PointWithKeyword({
    required this.id,
    this.leftOffset,
    this.topOffset,
    this.rightOffset,
    this.bottomOffset,
    required this.keywords,
  });

  int id;
  int? leftOffset;
  int? topOffset;
  int? rightOffset;
  int? bottomOffset;
  List<Keyword> keywords;

  factory PointWithKeyword.fromJson(Map<String, dynamic> json) {
    return PointWithKeyword(
      id: json['id'] as int,
      leftOffset: json['leftOffset'] as int,
      topOffset: json['topOffset'] as int,
      rightOffset: json['rightOffset'] as int,
      bottomOffset: json['bottomOffset'] as int,
      keywords: List<Keyword>.from(
          json['keywords'].map((data) => Keyword.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'leftOffset': leftOffset,
        'topOffset': topOffset,
        'rightOffset': rightOffset,
        'bottomOffset': bottomOffset,
        'keywords': keywords,
      };
}
