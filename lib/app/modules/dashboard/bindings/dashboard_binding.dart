import 'package:alfiyah_apps/app/modules/Services/controllers/services_controller.dart';
import 'package:alfiyah_apps/app/modules/booking/controllers/booking_controller.dart';
import 'package:alfiyah_apps/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
  }
}
