import 'package:get/get.dart';
import 'package:keyword/models/app_info.dart';
import 'package:keyword/repository/screenshot_list_repository.dart';

import 'package:keyword/models/screenshot_list_result.dart';

class ScreenshotListController extends GetxController {
  ScreenshotListController({required this.applicationId});

  int applicationId = 0;

  int roleCount = 0;
  ScreenshotListResult? result;

  @override
  void onInit() {
    _loadScreenshots(applicationId);
    super.onInit();
  }

  void _loadScreenshots(int applicationId) async {
    result =
        await ScreenshotListRepository().getScreenshotListView(applicationId);
    update();
  }
}
