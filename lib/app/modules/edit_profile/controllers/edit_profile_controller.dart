import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    final userData = await StorageService.getUserData();
    if (userData['name'] != null) {
      nameController.text = userData['name'] as String;
      emailController.text = userData['email'] as String;
      // Phone & address will be loaded from API if available
    }
  }

  void saveProfile() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama dan email harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await AuthService.updateProfile(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
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
          'Profile berhasil diupdate',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
      } else {
        Get.snackbar(
          'Error',
          result['message'] ?? 'Gagal update profile',
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

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
