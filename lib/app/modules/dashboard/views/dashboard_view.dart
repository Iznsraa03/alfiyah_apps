import 'dart:ui';
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});
  final DashboardController controller = Get.find<DashboardController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          extendBody: true, // 🔥 penting agar blur tembus body
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: _glassBottomNavbar(),
        ));
  }

  Widget _glassBottomNavbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.50),
            border: Border(
              top: BorderSide(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.secondary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.brush),
                label: 'Service',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_online),
                label: 'Booking',
              ),
            ],
          ),
        ),
      ),
    );
  }
}