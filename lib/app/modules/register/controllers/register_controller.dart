import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void register() async {
    // Validate
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama, email, dan password harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password minimal 6 karakter',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await AuthService.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        address: addressController.text.trim().isNotEmpty 
            ? addressController.text.trim() 
            : null,
        phoneNumber: phoneController.text.trim().isNotEmpty 
            ? phoneController.text.trim() 
            : null,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          'Berhasil',
          'Akun berhasil dibuat. Silakan login.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          'Registrasi Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
