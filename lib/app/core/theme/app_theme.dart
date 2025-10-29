import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Definisikan warna tema "Cinema Noir"
  static const Color primaryGold = Color(0xFFD4AF37); // Emas yang elegan
  static const Color darkBackground = Color(0xFF121212); // Hitam pekat
  static const Color secondaryBackground = Color(
    0xFF1A1A1A,
  ); // Sedikit lebih terang
  static const Color lightText = Color(0xFFF5F5F5); // Putih gading
  static const Color darkText = Color(0xFF000000); // Hitam

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryGold,
    scaffoldBackgroundColor: darkBackground,

    // Tema untuk AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: secondaryBackground,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.playfairDisplay(
        // Font elegan untuk judul
        color: primaryGold,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: const IconThemeData(color: primaryGold),
    ),

    // Tema untuk Tombol
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGold,
        foregroundColor: darkText,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: GoogleFonts.poppins(
          // Font modern untuk tombol
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Tema untuk Input Text
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: secondaryBackground.withOpacity(0.5),
      hintStyle: GoogleFonts.poppins(color: lightText.withOpacity(0.5)),
      labelStyle: GoogleFonts.poppins(color: primaryGold),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: primaryGold, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: secondaryBackground, width: 1),
      ),
    ),

    // Tema untuk Text
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme.apply(
        bodyColor: lightText,
        displayColor: lightText,
      ),
    ),

    // Tema untuk ikon
    iconTheme: const IconThemeData(color: lightText),

    colorScheme: const ColorScheme.dark(
      primary: primaryGold,
      secondary: primaryGold,
      background: darkBackground,
      surface: secondaryBackground,
    ),
  );
}
