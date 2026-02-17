import 'package:get/get.dart';

import '../controllers/admin_segments_controller.dart';

class AdminSegmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSegmentsController>(
      () => AdminSegmentsController(),
    );
  }
}
