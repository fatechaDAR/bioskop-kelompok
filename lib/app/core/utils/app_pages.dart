import 'package:get/get.dart';
import '../../modules/auth/login/login_binding.dart';
import '../../modules/auth/login/login_page.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn, // Transisi elegan
    ),
  ];
}
