import 'dart:async';
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
  StreamSubscription<Map<String, dynamic>>? _bookingStream;
  
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
    _startBookingStream();
  }

  void _startBookingStream() {
    _bookingStream?.cancel();
    _bookingStream = BookingService.streamBookings().listen((event) {
      final payload = event['data'];
      if (payload is Map<String, dynamic>) {
        _upsertBooking(payload);
      }
    }, onError: (error) {
      developer.log('❌ Booking stream error: $error', name: 'AdminHome');
    });
  }

  @override
  void onClose() {
    _bookingStream?.cancel();
    super.onClose();
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
      _sortBookingsByLatest();
      developer.log('✅ Bookings loaded: ${bookings.length} items', name: 'AdminHome');
    } else {
      developer.log('❌ Failed to load bookings', name: 'AdminHome');
    }
  }

  void _upsertBooking(Map<String, dynamic> booking) {
    final bookingId = booking['id'] as int?;
    if (bookingId == null) {
      return;
    }

    final index = bookings.indexWhere((item) => item['id'] == bookingId);
    if (index == -1) {
      bookings.add(booking);
    } else {
      bookings[index] = booking;
    }
    _sortBookingsByLatest();
  }

  void _sortBookingsByLatest() {
    if (bookings.isEmpty) {
      return;
    }

    bookings.sort((a, b) {
      final aDate = _extractLatestTimestamp(a);
      final bDate = _extractLatestTimestamp(b);
      return bDate.compareTo(aDate);
    });
    bookings.refresh();
  }

  DateTime _extractLatestTimestamp(Map<String, dynamic> booking) {
    final fields = [
      booking['updated_priority_at'],
      booking['tanggal_booking'],
      booking['tanggal_acara'],
    ];

    for (final value in fields) {
      if (value is String) {
        final parsed = DateTime.tryParse(value);
        if (parsed != null) {
          return parsed;
        }
      }
    }
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  String getServiceName(int id) => serviceTypesMap[id]?['name'] ?? 'Service';

  void goToManageServices() {
    Get.toNamed(Routes.ADMIN_SERVICES);
  }

  void goToSegments() {
    Get.toNamed(Routes.ADMIN_SEGMENTS);
  }

  void logOut(){
    Get.offAllNamed(Routes.LOGIN);
  }
}
