import 'package:get/get.dart';
import 'package:keyword/models/home_result.dart';
import 'package:keyword/repository/home_repository.dart';

class HomeController extends GetxController {
  int count = 0;
  List<HomeResult> list = [];

  @override
  void onInit() {
    _loadApps();
    super.onInit();
  }

  void _loadApps() async {
    List<HomeResult> homeAppResultList = await HomeRepository().getHomeView();
    if (homeAppResultList != null && homeAppResultList.isNotEmpty) {
      list = homeAppResultList;
      count = list.length;
    }
    update();
  }
}
