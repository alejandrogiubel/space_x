import 'package:space_x/app/modules/past_launches_module/past_launches_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PastLaunchesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PastLaunchesController());
  }
}