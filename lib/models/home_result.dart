import 'package:keyword/models/app_info.dart';
import 'package:keyword/models/screenshot.dart';

class HomeResult {
  HomeResult({
    required this.appInfo,
    required this.screenshots,
  });

  AppInfo appInfo;
  List<Screenshot> screenshots;

  factory HomeResult.fromJson(Map<String, dynamic> json) {
    return HomeResult(
      appInfo: AppInfo.fromJson(json['appInfo']),
      screenshots: List<Screenshot>.from(
          json['screenshots'].map((data) => Screenshot.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'appInfo': appInfo,
        'screenshots': screenshots,
      };
}
