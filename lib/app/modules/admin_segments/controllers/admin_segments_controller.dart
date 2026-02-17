import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/data/services/segment_service.dart';
import 'package:get/get.dart';

class AdminSegmentsController extends GetxController {
  final isLoading = false.obs;
  final segments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSegments();
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
