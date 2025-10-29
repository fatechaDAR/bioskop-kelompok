import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';

class LoginController extends GetxController {
  // Gunakan TextEditingController untuk input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observabel untuk loading state
  final isLoading = false.obs;

  @override
  void onClose() {
    // Selalu dispose controller saat tidak digunakan
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Fungsi untuk login
  void login() async {
    isLoading.value = true;

    // --- LOGIKA FIREBASE AUTH NANTI DI SINI ---
    // try {
    //   String email = emailController.text.trim();
    //   String password = passwordController.text.trim();
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //   Get.offAllNamed(AppRoutes.home); // Pindah ke Home setelah sukses
    // } on FirebaseAuthException catch (e) {
    //   Get.snackbar("Login Gagal", e.message ?? "Terjadi kesalahan");
    // } finally {
    //   isLoading.value = false;
    // }

    // Simulasi login untuk sekarang
    await Future.delayed(const Duration(seconds: 2));
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    isLoading.value = false;

    // Pindah ke halaman utama
    Get.offAllNamed(AppRoutes.home);
  }
}
