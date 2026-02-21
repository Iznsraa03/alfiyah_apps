import 'dart:async';
import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/data/services/segment_service.dart';
import 'package:get/get.dart';

class AdminSegmentsController extends GetxController {
  static const _categories = [
    {'key': 'loyal', 'label': 'Loyal'},
    {'key': 'aktif', 'label': 'Aktif'},
    {'key': 'potensial', 'label': 'Potensial'},
    {'key': 'pasif', 'label': 'Pasif'},
  ];

  static const _categoryDescriptions = {
    'loyal': 'Pelanggan paling aktif dengan frekuensi tinggi dan nilai transaksi besar.',
    'aktif': 'Pelanggan rutin yang stabil dengan pola booking konsisten.',
    'potensial': 'Pelanggan dengan peluang besar untuk ditingkatkan loyalitasnya.',
    'pasif': 'Pelanggan yang mulai pasif dan perlu strategi reaktivasi.',
  };

  final isLoading = false.obs;
  final segments = <Map<String, dynamic>>[].obs;
  final selectedCategory = 'loyal'.obs;
  StreamSubscription<Map<String, dynamic>>? _segmentStream;

  List<Map<String, dynamic>> get loyalSegments =>
      _filterByCategory('loyal');
  List<Map<String, dynamic>> get aktifSegments =>
      _filterByCategory('aktif');
  List<Map<String, dynamic>> get potensialSegments =>
      _filterByCategory('potensial');
  List<Map<String, dynamic>> get pasifSegments =>
      _filterByCategory('pasif');

  List<Map<String, String>> get categoryOptions => _categories
      .map((item) =>
          {'key': item['key'].toString(), 'label': item['label'].toString()})
      .toList();

  String get categoryDescription =>
      _categoryDescriptions[selectedCategory.value] ?? '';

  List<Map<String, dynamic>> get filteredSegments {
    switch (selectedCategory.value) {
      case 'loyal':
        return loyalSegments;
      case 'aktif':
        return aktifSegments;
      case 'potensial':
        return potensialSegments;
      case 'pasif':
        return pasifSegments;
      default:
        return loyalSegments;
    }
  }

  void selectCategory(String key) {
    selectedCategory.value = key;
  }

  List<Map<String, dynamic>> _filterByCategory(String key) {
    return segments.where((item) {
      final label = (item['customer_segment'] ?? '').toString().toLowerCase();
      return label == key.toLowerCase();
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    loadSegments();
    _startSegmentStream();
  }

  void _startSegmentStream() {
    _segmentStream?.cancel();
    _segmentStream = SegmentService.streamSegments().listen((event) {
      final payload = event['data'];
      if (payload is List) {
        segments.value = payload.cast<Map<String, dynamic>>();
      }
    }, onError: (error) {
      developer.log('❌ Segment stream error: $error', name: 'AdminSegments');
    });
  }

  @override
  void onClose() {
    _segmentStream?.cancel();
    super.onClose();
  }

  void loadSegments() async {
    developer.log('🔵 Loading segments...', name: 'AdminSegments');
    isLoading.value = true;
    final result = await SegmentService.getSegments();
    isLoading.value = false;

    if (result['success'] == true) {
      segments.value = (result['data'] as List).cast<Map<String, dynamic>>();
      developer.log('✅ Segments loaded: ${segments.length}', name: 'AdminSegments');
    } else {
      developer.log('❌ Failed to load segments', name: 'AdminSegments');
    }
  }
}
