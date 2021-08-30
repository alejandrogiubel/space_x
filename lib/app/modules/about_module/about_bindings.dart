import 'package:space_x/app/modules/about_module/about_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class aboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => aboutController());
  }
}