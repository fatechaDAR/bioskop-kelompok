import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

// --- INI PERBAIKANNYA ---
// Hanya dua level naik (../..)
import '../../core/utils/app_routes.dart';

class HomeController extends GetxController {
  void logout() async {
    // Keluar dari Firebase
    await FirebaseAuth.instance.signOut();
    // Kembali ke halaman login
    Get.offAllNamed(AppRoutes.login);
  }
}
