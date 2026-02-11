

import 'package:alfiyah_apps/app/modules/Services/views/services_view.dart';
import 'package:alfiyah_apps/app/modules/booking/views/booking_view.dart';
import 'package:alfiyah_apps/app/modules/home/views/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;

  void changePage(int index){
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeView(),
    ServicesView(),
    BookingView(),
  ];
}
