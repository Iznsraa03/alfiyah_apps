import 'package:get/get.dart';

import '../controllers/admin_services_controller.dart';

class AdminServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminServicesController>(
      () => AdminServicesController(),
    );
  }
}
