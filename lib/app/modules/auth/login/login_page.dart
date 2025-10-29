import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_controller.dart';
import '../../../core/theme/app_theme.dart'; // Import tema kita

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
                // 1. Judul Elegan
                Text(
                  "Cinema Noir",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    // Font khusus
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.primaryGold,
                  ),
                ),
                Text(
                  "An elegant movie experience.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppTheme.lightText.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 60),

                // 2. Form Email
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppTheme.lightText),
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppTheme.primaryGold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Form Password
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  style: const TextStyle(color: AppTheme.lightText),
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppTheme.primaryGold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Lupa Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(color: AppTheme.primaryGold),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // 4. Tombol Login
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryGold,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: controller.login,
                          child: const Text("LOGIN"),
                        ),
                ),
                const SizedBox(height: 40),

                // 5. Pilihan Daftar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: AppTheme.lightText.withOpacity(0.7),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Arahkan ke halaman Register
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppTheme.primaryGold,
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
