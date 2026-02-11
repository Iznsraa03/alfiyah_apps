import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/priorityBadge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_booking_detail_controller.dart';

class AdminBookingDetailView extends GetView<AdminBookingDetailController> {
  const AdminBookingDetailView({super.key});

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
          'Detail Booking',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        final booking = controller.booking;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Customer Info
                Container(
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
                      const Text(
                        'Informasi Pelanggan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      _infoRow(Icons.person_outline, (booking['user'] as Map?)?['name'] ?? 'User ${booking['user_id']}'),
                      const Gap(8),
                      _infoRow(Icons.email_outlined, (booking['user'] as Map?)?['email'] ?? '-'),
                      const Gap(8),
                      _infoRow(Icons.phone_outlined, (booking['user'] as Map?)?['phone_number'] ?? '-'),
                    ],
                  ),
                ),
                const Gap(16),
                // Service Info
                Container(
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
                      const Text(
                        'Informasi Layanan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      _infoRow(Icons.brush_outlined, 'Service ID: ${booking['service_type_id']}'),
                      const Gap(8),
                      _infoRow(Icons.event, 'Acara: ${booking['tanggal_acara']}'),
                      const Gap(8),
                      _infoRow(Icons.people, '${booking['jumlah_client']} client'),
                      const Gap(8),
                      _infoRow(Icons.attach_money, _formatRupiah(booking['price_locked'] as String)),
                    ],
                  ),
                ),
                const Gap(16),
                // Priority & Segmentation Info
                Container(
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
                      const Text(
                        'Analisis Prioritas',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          const Text(
                            'Priority Score:',
                            style: TextStyle(fontSize: 12),
                          ),
                          const Gap(8),
                          Text(
                            '${booking['priority_score']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          priorityBadge(booking['priority_segment'] as String),
                          monetaryBadge(booking['monetary_level'] as String),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getUrgencyColor(booking['urgency_level'] as String).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Urgency: ${booking['urgency_level']}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: _getUrgencyColor(booking['urgency_level'] as String),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),
                      Text(
                        'Last updated: ${booking['updated_priority_at']}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                // Status Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Status Booking',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking['status'] as String).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              (booking['status'] as String).toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _getStatusColor(booking['status'] as String),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: controller.showStatusDialog,
                        icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                        label: const Text(
                          'Update Status',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const Gap(8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  Color _getUrgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case 'urgent':
        return Colors.red;
      case 'soon':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
