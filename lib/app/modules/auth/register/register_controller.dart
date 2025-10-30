import 'package:flutter/material.dart';
import 'package:get/get.dart';
// --- INI PERBAIKANNYA ---
import '../../../core/utils/app_routes.dart';

// Import Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  // Instance Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "Semua field harus diisi.");
      return;
    }

    isLoading.value = true;
    try {
      // 1. Buat user di Firebase Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      // 2. Simpan data user (nama, email) ke Firestore
      // Ini penting untuk halaman profil nanti
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // 3. Jika sukses, lempar ke Halaman Home
      Get.offAllNamed(AppRoutes.home); // Langsung lempar ke home
    } on FirebaseAuthException catch (e) {
      // Tangani error
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Password terlalu lemah (minimal 6 karakter).';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Email sudah terdaftar.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Format email tidak valid.';
      } else {
        errorMessage = e.message ?? "Terjadi kesalahan saat registrasi.";
      }
      Get.snackbar(
        "Registrasi Gagal",
        errorMessage,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Registrasi Gagal",
        "Terjadi kesalahan: ${e.toString()}",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
