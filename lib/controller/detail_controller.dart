import 'package:get/get.dart';
import 'package:keyword/models/detail_result.dart';
import 'package:keyword/repository/detail_repository.dart';

class DetailController extends GetxController {
  DetailController({required this.applicationId});

  int applicationId = 0;

  DetailResult? result;

  @override
  void onInit() {
    _loadScreenshots(applicationId);
    super.onInit();
  }

  void _loadScreenshots(int applicationId) async {
    result = await DetailRepogitory().getDetailListView(applicationId);
    update();
  }
}
