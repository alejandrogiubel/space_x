import '../../app/modules/about_module/about_page.dart';
import '../../app/modules/about_module/about_bindings.dart';
import '../../app/modules/models3d_module/models3d_page.dart';
import '../../app/modules/models3d_module/models3d_bindings.dart';
import '../../app/modules/past_launches_module/past_launches_page.dart';
import '../../app/modules/past_launches_module/past_launches_bindings.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/home_module/home_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PAST_LAUNCHES,
      page: () => PastLaunchesPage(),
      binding: PastLaunchesBinding(),
    ),
    GetPage(
      name: Routes.MODELS3D,
      page: () => Models3dPage(),
      binding: Models3dBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutPage(),
      binding: aboutBinding(),
    ),
  ];
}
