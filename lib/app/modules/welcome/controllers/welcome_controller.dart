import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  final welcomePages = [
    {
      'image': 'assets/welcome/scadule.svg',
      'title': 'Jadwal Fleksibel',
      'subtitle': 'Booking layanan makeup & photo kapan saja sesuai jadwal kamu.',
    },
    {
      'image': 'assets/welcome/party.svg',
      'title': 'Paket Lengkap',
      'subtitle': 'Dari party, wisuda, hingga wedding. Semua ada di sini.',
    },
    {
      'image': 'assets/welcome/graduation.svg',
      'title': 'Kualitas Terbaik',
      'subtitle': 'Profesional berpengalaman untuk momen spesial kamu.',
    },
  ];

  void nextPage() {
    if (currentPage.value < welcomePages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goToHome();
    }
  }

  void skipToHome() {
    goToHome();
  }

  void goToHome() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
