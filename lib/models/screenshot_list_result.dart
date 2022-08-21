import 'package:keyword/models/app_info.dart';
import 'package:keyword/models/screenshot_by_role.dart';

class ScreenshotListResult {
  ScreenshotListResult({
    required this.appInfo,
    required this.screenshotsByRole,
  });

  AppInfo appInfo;
  List<ScreenshotByRole> screenshotsByRole;

  factory ScreenshotListResult.fromJson(Map<String, dynamic> json) {
    return ScreenshotListResult(
      appInfo: AppInfo.fromJson(json['appInfo']),
      screenshotsByRole: List<ScreenshotByRole>.from(json['screenshotsByRole']
          .map((data) => ScreenshotByRole.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'appInfo': appInfo,
        'screenshotsByRole': screenshotsByRole,
      };
}
