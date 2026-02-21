import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final bookings = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final serviceTypesMap = <int, Map<String, dynamic>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadServiceTypes();
    loadBookings();
  }

  void loadServiceTypes() async {
    final result = await ServiceService.getPackages();
    
    if (result['success'] == true) {
      final packages = result['data'] as List;
      
      // Build service types map
      for (var package in packages) {
        final serviceTypes = package['service_types'] as List;
        for (var serviceType in serviceTypes) {
          final st = serviceType as Map<String, dynamic>;
          serviceTypesMap[st['id'] as int] = st;
        }
      }
    }
  }

  void loadBookings() async {
    isLoading.value = true;

    final result = await BookingService.getMyBookings();

    isLoading.value = false;

    if (result['success'] == true) {
      final data = result['data'] as List;
      bookings.value = data.cast<Map<String, dynamic>>();
    } else {
      Get.snackbar(
        'Error',
        result['message'] ?? 'Gagal memuat booking',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String getServiceName(int serviceTypeId) {
    final serviceType = serviceTypesMap[serviceTypeId];
    return serviceType?['name'] ?? 'Service ID: $serviceTypeId';
  }
}
