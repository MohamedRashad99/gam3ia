import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/show_jam_description/bindings/show_jam_description_binding.dart';
import '../modules/show_jam_description/views/show_jam_description_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_JAM_DESCRIPTION,
      page: () => const ShowJamDescriptionView(),
      binding: ShowJamDescriptionBinding(),
    ),
  ];
}
