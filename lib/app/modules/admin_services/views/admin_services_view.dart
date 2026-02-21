import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_services_controller.dart';

class AdminServicesView extends GetView<AdminServicesController> {
  const AdminServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Manage Services',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AppColors.primary),
            onPressed: controller.showAddPackageDialog,
          ),
          const Gap(8),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.packages.isEmpty) {
          return const Center(
            child: Text('Belum ada package.'),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Service Package',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Gap(12),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.packages.length,
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    final package = controller.packages[index];
                    return _packageCard(package);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _packageCard(Map<String, dynamic> package) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      package['name'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      package['description'] as String? ?? '- ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${(package['service_types'] as List).length} layanan',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, size: 18, color: AppColors.primary),
                        onPressed: () => controller.showEditPackageDialog(package),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                        onPressed: () => controller.deletePackage(package['id'] as int),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Gap(12),
          const Divider(),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Types',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton.icon(
                onPressed: () => controller.showAddServiceTypeDialog(package['id'] as int),
                icon: Icon(Icons.add, size: 16, color: AppColors.primary),
                label: Text(
                  'Tambah',
                  style: TextStyle(fontSize: 12, color: AppColors.primary),
                ),
              ),
            ],
          ),
          const Gap(8),
          if ((package['service_types'] as List).isEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Belum ada service type.',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (package['service_types'] as List).length,
              separatorBuilder: (context, index) => const Gap(8),
              itemBuilder: (context, index) {
                final type = (package['service_types'] as List)[index] as Map<String, dynamic>;
                return _serviceTypeItem(type);
              },
            ),
        ],
      ),
    );
  }

  Widget _serviceTypeItem(Map<String, dynamic> type) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type['name'] as String? ?? '-',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  type['description'] as String? ?? '- ',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatRupiah(type['price']?.toString() ?? '0'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, size: 18, color: AppColors.primary),
                    onPressed: () => controller.showEditServiceTypeDialog(type),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                    onPressed: () => controller.deleteServiceType(type['id'] as int),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatRupiah(String rawPrice) {
    final parsed = double.tryParse(rawPrice) ?? 0;
    final value = parsed.round();
    final digits = value.toString().split('');
    final buffer = StringBuffer('Rp ');
    for (var i = 0; i < digits.length; i++) {
      final reverseIndex = digits.length - i;
      buffer.write(digits[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }
}
