import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_controller.dart';

// --- INI PERBAIKANNYA (3 level ../) ---
import '../../../core/theme/app_theme.dart';

// (Kita tidak butuh app_routes.dart di sini karena Get.back() sudah built-in)

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Judul
                Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.primaryGold, // <-- Ini butuh app_theme
                  ),
                ),
                Text(
                  "Join the Noir experience.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppTheme.lightText.withOpacity(
                      0.7,
                    ), // <-- Ini butuh app_theme
                  ),
                ),
                const SizedBox(height: 50),

                // 2. Form Nama
                TextField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                    color: AppTheme.lightText,
                  ), // <-- Ini butuh app_theme
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppTheme.primaryGold,
                    ), // <-- Ini butuh app_theme
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Form Email
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: AppTheme.lightText,
                  ), // <-- Ini butuh app_theme
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppTheme.primaryGold,
                    ), // <-- Ini butuh app_theme
                  ),
                ),
                const SizedBox(height: 20),

                // 4. Form Password
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    color: AppTheme.lightText,
                  ), // <-- Ini butuh app_theme
                  decoration: const InputDecoration(
                    labelText: "Password (Min. 6 characters)",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppTheme.primaryGold,
                    ), // <-- Ini butuh app_theme
                  ),
                ),
                const SizedBox(height: 40),

                // 5. Tombol Register
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color:
                                AppTheme.primaryGold, // <-- Ini butuh app_theme
                          ),
                        )
                      : ElevatedButton(
                          onPressed: controller.register,
                          child: const Text("REGISTER"),
                        ),
                ),
                const SizedBox(height: 40),

                // 6. Pilihan Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: AppTheme.lightText.withOpacity(0.7),
                      ), // <-- Ini butuh app_theme
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back(); // Kembali ke halaman Login
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color:
                              AppTheme.primaryGold, // <-- Ini butuh app_theme
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
