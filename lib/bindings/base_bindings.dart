import 'package:get/get.dart';

import '../controller/home_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
