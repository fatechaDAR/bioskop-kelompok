import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/theme/app_theme.dart';
import 'app/core/utils/app_pages.dart';
import 'app/core/utils/app_routes.dart';
// import 'package:firebase_core/firebase_core.dart'; // Uncomment saat Firebase siap

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform, // Dari file firebase_options.dart
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @Override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Cinema Noir",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.login, // Halaman awal
      getPages: AppPages.pages, // Daftar semua halaman
    );
  }
}
