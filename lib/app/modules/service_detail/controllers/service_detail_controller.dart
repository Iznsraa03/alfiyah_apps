import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class ServiceDetailController extends GetxController {
  final isLoading = false.obs;
  final serviceType = <String, dynamic>{}.obs;
  final packageInfo = <String, dynamic>{}.obs;
  
  final tanggalAcaraController = TextEditingController();
  final jumlahClientController = TextEditingController();
  final selectedDate = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();
    developer.log('🔵 ServiceDetail onInit', name: 'ServiceDetail');
    developer.log('Arguments: ${Get.arguments}', name: 'ServiceDetail');
    
    // Get data from route parameters
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      developer.log('Arguments keys: ${args.keys}', name: 'ServiceDetail');
      
      if (args.containsKey('serviceType') && args.containsKey('package')) {
        serviceType.value = args['serviceType'] as Map<String, dynamic>;
        packageInfo.value = args['package'] as Map<String, dynamic>;
        developer.log('✅ Data loaded: ${serviceType.value['name']}', name: 'ServiceDetail');
      } else {
        developer.log('❌ Missing serviceType or package in arguments', name: 'ServiceDetail');
      }
    } else {
      developer.log('❌ Arguments is null or not Map', name: 'ServiceDetail');
    }
  }

  void selectDate() async {
    final picked = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: DateTime.now().add(const Duration(days: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      ),
    );

    if (picked != null) {
      selectedDate.value = picked;
      tanggalAcaraController.text = 
          '${picked.day}/${picked.month}/${picked.year} ${picked.hour}:${picked.minute.toString().padLeft(2, '0')}';
    }
  }

  void bookService() async {
    if (selectedDate.value == null || jumlahClientController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Tanggal acara dan jumlah client harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final serviceTypeId = serviceType.value['id'] as int;
    final jumlahClient = int.tryParse(jumlahClientController.text);

    if (jumlahClient == null || jumlahClient <= 0) {
      Get.snackbar(
        'Error',
        'Jumlah client harus berupa angka valid',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await BookingService.createBooking(
        serviceTypeId: serviceTypeId,
        tanggalAcara: selectedDate.value!,
        jumlahClient: jumlahClient,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          'Berhasil',
          'Booking berhasil dibuat!',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        // Navigate to booking list
        Get.offAllNamed(Routes.DASHBOARD);
        Get.toNamed(Routes.BOOKING);
      } else {
        Get.snackbar(
          'Error',
          result['message'] ?? 'Gagal membuat booking',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    tanggalAcaraController.dispose();
    jumlahClientController.dispose();
    super.onClose();
  }
}
