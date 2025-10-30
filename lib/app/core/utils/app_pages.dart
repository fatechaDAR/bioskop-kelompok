import 'package:get/get.dart';

// Import file-file login
import '../../modules/auth/login/login_binding.dart';
import '../../modules/auth/login/login_page.dart';

// Import file-file register
import '../../modules/auth/register/register_binding.dart';
import '../../modules/auth/register/register_page.dart';

// Import file-file home (BARU)
import '../../modules/home/home_binding.dart';
import '../../modules/home/home_page.dart';

// Import file routes
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    // Rute Autentikasi
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),

    // Rute Home (BARU)
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
