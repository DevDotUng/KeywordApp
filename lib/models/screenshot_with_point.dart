import 'package:keyword/models/point_with_keyword.dart';

class ScreenshotWithPoint {
  ScreenshotWithPoint({
    required this.id,
    required this.role,
    required this.image,
    required this.pointWithKeyword,
  });

  int id;
  String role;
  String image;
  List<PointWithKeyword> pointWithKeyword;

  factory ScreenshotWithPoint.fromJson(Map<String, dynamic> json) {
    return ScreenshotWithPoint(
      id: json['id'] as int,
      role: json['role'] as String,
      image: json['image'] as String,
      pointWithKeyword: List<PointWithKeyword>.from(json['pointWithKeyword']
          .map((data) => PointWithKeyword.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
        'image': image,
        'pointWithKeyword': pointWithKeyword,
      };

  String get imageUrl => "http://54.148.218.212:8080/image/screenshot/$image";
}
