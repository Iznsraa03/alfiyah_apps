
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final userName = 'Loading...'.obs;
  final userEmail = ''.obs;
  final userRole = 'Customer'.obs;
  final userLocation = 'Malang, Indonesia'.obs;

  final searchQuery = ''.obs;

  final quickAccessItems = [
    {
      'title': 'Booking',
      'subtitle': 'Pesan layanan',
      'icon': Icons.book_online,
      'route': Routes.BOOKING,
    },
    {
      'title': 'Services',
      'subtitle': 'Lihat paket',
      'icon': Icons.brush,
      'route': Routes.SERVICES,
    },
    {
      'title': 'Profile',
      'subtitle': 'Akun kamu',
      'icon': Icons.person_outline,
      'route': Routes.PROFILE,
    },
  ];

  void tombol() {
    Get.offNamed(Routes.BOOKING);
  }

  void toProfile() {
    Get.toNamed(Routes.PROFILE);
  }

  List<Map<String, dynamic>> get filteredQuickAccessItems {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) {
      return quickAccessItems;
    }
    return quickAccessItems.where((item) {
      final title = (item['title'] as String).toLowerCase();
      final subtitle = (item['subtitle'] as String).toLowerCase();
      return title.contains(query) || subtitle.contains(query);
    }).toList();
  }

  bool get isMainCardVisible {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) {
      return true;
    }
    return query.contains('populer') ||
        query.contains('wedding') ||
        query.contains('make up') ||
        query.contains('makeup');
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    final userData = await StorageService.getUserData();
    if (userData['name'] != null) {
      userName.value = userData['name'] as String;
      userEmail.value = userData['email'] as String;
      userRole.value = userData['role'] == 'admin' ? 'Admin' : 'Premium Member';
    }
  }

  void goToQuickAccess(String route) {
    Get.toNamed(route);
  }
}
