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
  ];
}
