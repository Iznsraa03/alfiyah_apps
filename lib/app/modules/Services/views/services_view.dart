import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/servicePackageCard.dart';
import 'package:alfiyah_apps/app/components/serviceTypeCard.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  ServicesView({super.key});

  @override
  final ServicesController controller = Get.find<ServicesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Layanan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search_outlined, color: AppColors.primary),
        //     onPressed: () {},
        //   ),
        //   const Gap(8),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    hintText: 'Cari paket atau layanan',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(24),
              Obx(() {
                final filtered = controller.filteredPackages;
                if (filtered.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: const Text(
                      'Tidak ada layanan yang cocok.',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Paket Populer',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Gap(12),
                    servicePackageCard(
                      name: filtered.first['name'] as String,
                      description: filtered.first['description'] as String,
                      totalTypes: (filtered.first['service_types'] as List)
                          .length,
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Semua Layanan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${filtered.length} paket',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        final package = filtered[index];
                        final types = package['service_types'] as List;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            servicePackageCard(
                              name: package['name'] as String,
                              description: package['description'] as String,
                              totalTypes: types.length,
                            ),
                            const Gap(12),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: types.length,
                              separatorBuilder: (context, index) => const Gap(12),
                              itemBuilder: (context, typeIndex) {
                                final type = types[typeIndex]
                                    as Map<String, dynamic>;
                                return serviceTypeCard(
                                  name: type['name'] as String,
                                  description: type['description'] as String,
                                  price: type['price'] as String,
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.SERVICE_DETAIL,
                                      arguments: {
                                        'serviceType': type,
                                        'package': package,
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const Gap(32),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
