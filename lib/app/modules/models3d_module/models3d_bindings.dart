import 'package:space_x/app/modules/models3d_module/models3d_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class Models3dBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Models3dController());
  }
}