import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_segments_controller.dart';

class AdminSegmentsView extends GetView<AdminSegmentsController> {
  const AdminSegmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Segmentasi Pelanggan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.segments.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('Belum ada data segmentasi.'),
              ),
            ),
          );
        }

        final segments = controller.filteredSegments;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _categoryCapsules(controller),
            const Gap(12),
            _categoryDescription(controller),
            const Gap(16),
            if (segments.isEmpty)
              _emptyCategoryState()
            else
              ...segments
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _segmentCard(item),
                      ))
                  .toList(),
          ],
        );
      }),
    );
  }

  Widget _categoryCapsules(AdminSegmentsController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return Row(
          children: controller.categoryOptions.map((item) {
            final key = item['key'] ?? '';
            final label = item['label'] ?? '';
            final isSelected = controller.selectedCategory.value == key;
            final colors = _categoryColors(key);

            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => controller.selectCategory(key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? colors.background : AppColors.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isSelected ? colors.border : AppColors.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? colors.text : AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }

  Widget _categoryDescription(AdminSegmentsController controller) {
    return Obx(() {
      final description = controller.categoryDescription;
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.08)),
        ),
        child: Text(
          description,
          style: TextStyle(color: AppColors.textSecondary, height: 1.4),
        ),
      );
    });
  }

  Widget _emptyCategoryState() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Belum ada data pada kategori ini.'),
      ),
    );
  }

  _CategoryColors _categoryColors(String key) {
    switch (key) {
      case 'loyal':
        return _CategoryColors(
          background: AppColors.primary.withValues(alpha: 0.15),
          border: AppColors.primary,
          text: AppColors.primary,
        );
      case 'aktif':
        return _CategoryColors(
          background: AppColors.secondary.withValues(alpha: 0.2),
          border: AppColors.secondary,
          text: AppColors.secondary,
        );
      case 'potensial':
        return _CategoryColors(
          background: AppColors.accent.withValues(alpha: 0.18),
          border: AppColors.accent,
          text: AppColors.accent,
        );
      case 'pasif':
        return _CategoryColors(
          background: AppColors.primary.withValues(alpha: 0.08),
          border: AppColors.primary.withValues(alpha: 0.5),
          text: AppColors.primary,
        );
      default:
        return _CategoryColors(
          background: AppColors.surface,
          border: AppColors.primary.withValues(alpha: 0.2),
          text: AppColors.textPrimary,
        );
    }
  }

  Widget _segmentCard(Map<String, dynamic> item) {
    final segment = (item['customer_segment'] ?? '-').toString();
    final frequency = (item['frequency'] ?? 0).toString();
    final monetary = (item['monetary'] ?? 0).toString();
    final recency = (item['recency'] ?? 0).toString();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item['name'] ?? '-',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  segment,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(child: _metricItem('Frekuensi', frequency)),
              const Gap(8),
              Expanded(child: _metricItem('Total', monetary)),
              const Gap(8),
              Expanded(child: _metricItem('Recency', recency)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _CategoryColors {
  const _CategoryColors({
    required this.background,
    required this.border,
    required this.text,
  });

  final Color background;
  final Color border;
  final Color text;
}
