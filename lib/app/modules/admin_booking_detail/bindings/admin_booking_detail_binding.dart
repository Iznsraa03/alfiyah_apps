import 'package:get/get.dart';

import '../controllers/admin_booking_detail_controller.dart';

class AdminBookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminBookingDetailController>(
      () => AdminBookingDetailController(),
    );
  }
}
