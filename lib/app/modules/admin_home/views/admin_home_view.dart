import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/priorityBadge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined, color: AppColors.primary),
            onPressed: controller.logOut,
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // // Stats Summary
              // const Text(
              //   'Ringkasan Hari Ini',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // const Gap(12),
              // Row(
              //   children: [
              //     Expanded(
              //       child: _statCard(
              //         'Total',
              //         '${controller.stats['total']}',
              //         Colors.blue,
              //       ),
              //     ),
              //     const Gap(12),
              //     Expanded(
              //       child: _statCard(
              //         'Pending',
              //         '${controller.stats['pending']}',
              //         Colors.orange,
              //       ),
              //     ),
              //   ],
              // ),
              // const Gap(12),
              // Row(
              //   children: [
              //     Expanded(
              //       child: _statCard(
              //         'High Priority',
              //         '${controller.stats['high']}',
              //         Colors.red,
              //       ),
              //     ),
              //     const Gap(12),
              //     Expanded(
              //       child: _statCard(
              //         'VIP',
              //         '${controller.stats['vip']}',
              //         Colors.purple,
              //       ),
              //     ),
              //   ],
              // ),
              // const Gap(24),
              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      'Manage Services',
                      Icons.brush_outlined,
                      controller.goToManageServices,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _actionButton(
                      'Segmentasi',
                      Icons.groups_2_outlined,
                      controller.goToSegments,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              // Filter Chips
              const Text(
                'Filter Booking',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _filterChip('Semua', 'all'),
                        const Gap(8),
                        _filterChip('High Priority', 'high'),
                        const Gap(8),
                        _filterChip('Medium Priority', 'medium'),
                        const Gap(8),
                        _filterChip('Low Priority', 'low'),
                        const Gap(8),
                        _filterChip('VIP Only', 'vip'),
                      ],
                    ),
                  )),
              const Gap(16),
              // Booking List
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ));
                }
                
                final bookings = controller.filteredBookings;
                if (bookings.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Tidak ada booking.'),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookings.length,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return _bookingCard(booking);
                  },
                );
              }),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const Gap(8),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterChip(String label, String value) {
    final isSelected = controller.selectedFilter.value == value;
    return GestureDetector(
      onTap: () => controller.setFilter(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _bookingCard(Map<String, dynamic> booking) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => controller.goToBookingDetail(booking['id'] as int),
        child: Container(
          padding: const EdgeInsets.all(14),
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
                children: [
                  urgencyBadge(booking['urgency_level'] as String? ?? 'upcoming'),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      (booking['user'] as Map?)?['name'] ?? 'User ${booking['user_id']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: booking['status'] == 'pending'
                          ? Colors.orange.withValues(alpha: 0.12)
                          : Colors.green.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      booking['status'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: booking['status'] == 'pending'
                            ? Colors.orange
                            : Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(8),
              Text(
                controller.getServiceName(booking['service_type_id'] as int),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              const Gap(8),
              Row(
                children: [
                  Icon(Icons.event, size: 14, color: AppColors.primary),
                  const Gap(4),
                  Expanded(
                    child: Text(
                      booking['tanggal_acara'] as String,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(12),
                  Icon(Icons.people, size: 14, color: AppColors.primary),
                  const Gap(4),
                  Text(
                    '${booking['jumlah_client']} client',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  priorityBadge(booking['priority_segment'] as String),
                  const Gap(8),
                  monetaryBadge(booking['monetary_level'] as String),
                  const Spacer(),
                  Text(
                    'Score: ${booking['priority_score']}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
