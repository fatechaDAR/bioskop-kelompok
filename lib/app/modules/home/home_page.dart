import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cinema Noir",
          style: GoogleFonts.playfairDisplay(
            color: AppTheme.primaryGold,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Tombol Logout
          IconButton(
            icon: const Icon(Icons.logout, color: AppTheme.primaryGold),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Home!',
          style: TextStyle(color: AppTheme.lightText, fontSize: 24),
        ),
      ),
    );
  }
}
