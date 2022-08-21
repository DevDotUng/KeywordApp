import 'package:keyword/models/screenshot.dart';

class ScreenshotByRole {
  ScreenshotByRole({
    required this.role,
    required this.screenshots,
  });

  String role;
  List<Screenshot> screenshots;

  factory ScreenshotByRole.fromJson(Map<String, dynamic> json) {
    return ScreenshotByRole(
      role: json['role'] as String,
      screenshots: List<Screenshot>.from(
          json['screenshots'].map((data) => Screenshot.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'role': role,
        'screenshots': screenshots,
      };
}
