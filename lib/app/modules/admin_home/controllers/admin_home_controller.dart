import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  final selectedFilter = 'all'.obs;
  final isLoading = false.obs;
  final serviceTypesMap = <int, Map<String, dynamic>>{}.obs;
  
  final bookings = <Map<String, dynamic>>[].obs;
  
  final _sampleBookings = [
    {
      'id': 1,
      'user_name': 'Sarah Amelia',
      'service_type': 'Wedding Make Up Premium',
      'tanggal_acara': '2026-02-15 14:00',
      'jumlah_client': 150,
      'price_locked': '12500000.00',
      'status': 'pending',
      'priority_score': 95,
      'priority_segment': 'high',
      'urgency_level': 'urgent',
      'monetary_level': 'vip',
    },
    {
      'id': 2,
      'user_name': 'Dina Kartika',
      'service_type': 'Engagement Photo',
      'tanggal_acara': '2026-02-20 10:00',
      'jumlah_client': 2,
      'price_locked': '3200000.00',
      'status': 'confirmed',
      'priority_score': 78,
      'priority_segment': 'medium',
      'urgency_level': 'soon',
      'monetary_level': 'premium',
    },
    {
      'id': 3,
      'user_name': 'Rina Putri',
      'service_type': 'Prewedding Indoor',
      'tanggal_acara': '2026-03-05 09:00',
      'jumlah_client': 2,
      'price_locked': '5750000.00',
      'status': 'pending',
      'priority_score': 62,
      'priority_segment': 'medium',
      'urgency_level': 'upcoming',
      'monetary_level': 'premium',
    },
    {
      'id': 4,
      'user_name': 'Maya Sari',
      'service_type': 'Reguler Party',
      'tanggal_acara': '2026-03-10 15:00',
      'jumlah_client': 1,
      'price_locked': '200000.00',
      'status': 'pending',
      'priority_score': 45,
      'priority_segment': 'low',
      'urgency_level': 'upcoming',
      'monetary_level': 'regular',
    },
  ];

  List<Map<String, dynamic>> get filteredBookings {
    if (selectedFilter.value == 'all') {
      return bookings;
    }
    return bookings.where((b) {
      if (selectedFilter.value == 'vip') {
        return b['monetary_level'] == 'vip';
      }
      return b['priority_segment'] == selectedFilter.value;
    }).toList();
  }

  Map<String, int> get stats {
    return {
      'total': bookings.length,
      'high': bookings.where((b) => b['priority_segment'] == 'high').length,
      'medium': bookings.where((b) => b['priority_segment'] == 'medium').length,
      'low': bookings.where((b) => b['priority_segment'] == 'low').length,
      'vip': bookings.where((b) => b['monetary_level'] == 'vip').length,
      'pending': bookings.where((b) => b['status'] == 'pending').length,
    };
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void goToBookingDetail(int bookingId) {
    developer.log('🔵 Navigating to booking detail ID: $bookingId', name: 'AdminHome');
    
    // Find booking data from list
    final bookingData = bookings.firstWhereOrNull((b) => b['id'] == bookingId);
    
    Get.toNamed(Routes.ADMIN_BOOKING_DETAIL, arguments: {
      'bookingId': bookingId,
      'bookingData': bookingData,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadServiceTypes();
    loadBookings();
  }

  void loadServiceTypes() async {
    developer.log('🔵 Loading service types...', name: 'AdminHome');
    final result = await ServiceService.getPackages();
    if (result['success'] == true) {
      final packages = result['data'] as List;
      for (var package in packages) {
        final serviceTypes = package['service_types'] as List;
        for (var st in serviceTypes) {
          serviceTypesMap[(st as Map)['id'] as int] = st as Map<String, dynamic>;
        }
      }
      developer.log('✅ Service types loaded: ${serviceTypesMap.length} types', name: 'AdminHome');
    } else {
      developer.log('❌ Failed to load service types', name: 'AdminHome');
    }
  }

  void loadBookings() async {
    developer.log('🔵 Loading all bookings (admin)...', name: 'AdminHome');
    isLoading.value = true;
    final result = await BookingService.getAllBookings();
    isLoading.value = false;
    
    if (result['success'] == true) {
      bookings.value = (result['data'] as List).cast<Map<String, dynamic>>();
      developer.log('✅ Bookings loaded: ${bookings.length} items', name: 'AdminHome');
    } else {
      developer.log('❌ Failed to load bookings', name: 'AdminHome');
    }
  }

  String getServiceName(int id) => serviceTypesMap[id]?['name'] ?? 'Service';

  void goToManageServices() {
    Get.toNamed('/admin-services');
  }

  void logOut(){
    Get.offAllNamed(Routes.LOGIN);
  }
}
