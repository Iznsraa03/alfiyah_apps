import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:get/get.dart';

class AdminBookingDetailController extends GetxController {
  final bookingId = 0.obs;
  final isLoading = false.obs;
  final isLoadingData = false.obs;

  final booking = <String, dynamic>{
    'id': 1,
    'user_id': 12,
    'user_name': 'Sarah Amelia',
    'user_email': 'sarah@example.com',
    'user_phone': '+62 812-3456-7890',
    'service_type_id': 5,
    'service_type': 'Wedding Make Up Premium',
    'package_name': 'Makeup Party',
    'tanggal_booking': '2026-02-10 14:30',
    'tanggal_acara': '2026-02-15 14:00',
    'jumlah_client': 150,
    'price_locked': '12500000.00',
    'status': 'pending',
    'priority_score': 95,
    'priority_segment': 'high',
    'urgency_level': 'urgent',
    'monetary_level': 'vip',
    'updated_priority_at': '2026-02-11 08:00',
  }.obs;

  final availableStatuses = ['pending', 'confirmed', 'completed', 'cancelled'];

  @override
  void onInit() {
    super.onInit();
    developer.log('🔵 AdminBookingDetail onInit', name: 'AdminBookingDetail');
    developer.log('Arguments: ${Get.arguments}', name: 'AdminBookingDetail');
    
    // Get booking data from arguments
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      bookingId.value = args['bookingId'] as int;
      
      if (args.containsKey('bookingData') && args['bookingData'] != null) {
        final data = args['bookingData'] as Map<String, dynamic>;
        booking.value = data;
        developer.log('✅ Booking data loaded from arguments', name: 'AdminBookingDetail');
      } else {
        developer.log('⚠️ No booking data, using sample', name: 'AdminBookingDetail');
      }
    } else {
      developer.log('❌ Invalid arguments', name: 'AdminBookingDetail');
    }
  }

  void updateStatus(String newStatus) async {
    developer.log('🔵 Updating booking status to: $newStatus', name: 'AdminBookingDetail');
    isLoading.value = true;

    final result = await BookingService.updateBookingStatus(
      bookingId: bookingId.value,
      status: newStatus,
    );

    isLoading.value = false;

    if (result['success'] == true) {
      final currentBooking = Map<String, dynamic>.from(booking.value);
      currentBooking['status'] = newStatus;
      booking.value = currentBooking;

      developer.log('✅ Booking status updated successfully', name: 'AdminBookingDetail');
      Get.snackbar(
        'Berhasil',
        'Status booking berhasil diupdate menjadi $newStatus',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      developer.log('❌ Failed to update booking status', name: 'AdminBookingDetail');
      Get.snackbar(
        'Error',
        result['message'] ?? 'Gagal update status',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showStatusDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update Status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ...availableStatuses.map((status) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    status.toUpperCase(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Get.back();
                    updateStatus(status);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
