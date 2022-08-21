import 'package:keyword/models/screenshot_with_point.dart';

class DetailResult {
  DetailResult({
    required this.screenshotWithPoint,
  });

  List<ScreenshotWithPoint> screenshotWithPoint;

  factory DetailResult.fromJson(Map<String, dynamic> json) {
    return DetailResult(
      screenshotWithPoint: List<ScreenshotWithPoint>.from(
          json['screenshotWithPoint']
              .map((data) => ScreenshotWithPoint.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'screenshotWithPoint': screenshotWithPoint,
      };
}
