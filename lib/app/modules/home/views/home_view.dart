import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/mainCard.dart';
import 'package:alfiyah_apps/app/components/quickAccessCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Beranda', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        // actions: [
        //   Icon(Icons.search_outlined, color: AppColors.primary),
        //   const Gap(20),
        //   CircleAvatar(
        //     backgroundColor: AppColors.secondary,
        //     child: Icon(Icons.person_2_outlined, color: AppColors.primary),
        //   ),
        //   const Gap(20),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(4),
                              Text(
                                controller.userRole.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),
                              // const Gap(6),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.location_on_outlined,
                              //       size: 14,
                              //       color: AppColors.primary,
                              //     ),
                              //     const Gap(4),
                              //     Text(
                              //       controller.userLocation.value,
                              //       style: const TextStyle(fontSize: 12),
                              //     ),
                              //   ],
                              // ),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: controller.toProfile,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search_outlined, color: AppColors.primary),
                    hintText: 'Cari layanan, booking, atau profil',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Obx(() {
                if (!controller.isMainCardVisible) {
                  return const SizedBox.shrink();
                }
                return mainCard(onPressed: controller.toServices);
              }),
              const Gap(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Akses Cepat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   'Lihat semua',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: AppColors.primary.withValues(alpha: 0.7),
                  //   ),
                  // ),
                ],
              ),
              const Gap(16),
              Obx(() {
                final items = controller.filteredQuickAccessItems;
                if (items.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: const Text(
                      'Tidak ada hasil akses cepat.',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return quickAccessCard(
                      title: item['title'] as String,
                      subtitle: item['subtitle'] as String,
                      icon: item['icon'] as IconData,
                      onTap: () => controller.goToQuickAccess(
                        item['route'] as String,
                      ),
                    );
                  },
                );
              }),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
