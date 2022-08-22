import 'package:get/get.dart';
import 'package:keyword/models/home_result.dart';
import 'package:keyword/repository/home_repository.dart';

class HomeController extends GetxController {
  int count = 0;
  List<HomeResult> list = [];

  Future<void> loadApps() async {
    List<HomeResult> homeAppResultList = await HomeRepository().getHomeView();
    if (homeAppResultList.isNotEmpty) {
      list = homeAppResultList;
      count = list.length;
    }
    update();
  }
}
