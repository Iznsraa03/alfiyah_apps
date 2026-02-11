# Project structure overview
```
// Structure of documents
└── lib/
    └── app/
        ├── Utils/
        │   ├── app_colors.dart
        ├── components/
        │   ├── categoryItems.dart
        │   ├── mainCard.dart
        ├── modules/
        │   ├── Services/
        │   │   ├── bindings/
        │   │   │   ├── services_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── services_controller.dart
        │   │   ├── views/
        │   │   │   └── services_view.dart
        │   ├── booking/
        │   │   ├── bindings/
        │   │   │   ├── booking_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── booking_controller.dart
        │   │   ├── views/
        │   │   │   └── booking_view.dart
        │   ├── dashboard/
        │   │   ├── bindings/
        │   │   │   ├── dashboard_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── dashboard_controller.dart
        │   │   ├── views/
        │   │   │   └── dashboard_view.dart
        │   ├── home/
        │   │   ├── bindings/
        │   │   │   ├── home_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── home_controller.dart
        │   │   ├── views/
        │   │   │   └── home_view.dart
        │   ├── profile/
        │   │   └── bindings/
        │   │       ├── profile_binding.dart
        │   │   └── controllers/
        │   │       ├── profile_controller.dart
        │   │   └── views/
        │   │       └── profile_view.dart
        ├── routes/
        │   └── app_pages.dart
        │   └── app_routes.dart
    └── main.dart

```
###  Path: `/lib/app/Utils/app_colors.dart`

```dart
import 'package:flutter/material.dart';

class AppColors{
  static const primary = Color(0xFFF875AA);
  static const secondary = Color(0xFFFBACCC);
  static const surface = Color(0xFFF1D1D0);
  static const background = Color(0xFFF4F9F9);
}
```
###  Path: `/lib/app/components/categoryItems.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GestureDetector categoryItem({
  required void Function()? onTap
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text('Wedding',style: TextStyle(color: Colors.white),)),
    ),
  );
}

```
###  Path: `/lib/app/components/mainCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

Container mainCard() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: AppColors.surface.withValues(alpha: 15.0),
        image: DecorationImage(
          image: AssetImage('assets/img/contoh.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              // color: AppColors.secondary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.secondary.withValues(alpha: 0.0),
                  AppColors.secondary.withValues(alpha: 50.0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Wedding Make Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ).copyWith(overlayColor: WidgetStatePropertyAll(AppColors.secondary.withValues(alpha: 30.0))),
                    child: Text(
                      'Booking Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
```
###  Path: `/lib/app/modules/Services/bindings/services_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
  }
}

```
###  Path: `/lib/app/modules/Services/controllers/services_controller.dart`

```dart
import 'package:get/get.dart';

class ServicesController extends GetxController {
  //TODO: Implement ServicesController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

```
###  Path: `/lib/app/modules/Services/views/services_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
      backgroundColor: AppColors.background,

        title: const Text('ServicesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServicesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/booking/bindings/booking_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
  }
}

```
###  Path: `/lib/app/modules/booking/controllers/booking_controller.dart`

```dart
import 'package:get/get.dart';

class BookingController extends GetxController {
  //TODO: Implement BookingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

```
###  Path: `/lib/app/modules/booking/views/booking_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text('BookingView'),
        automaticallyImplyActions: true,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/dashboard/bindings/dashboard_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}

```
###  Path: `/lib/app/modules/dashboard/controllers/dashboard_controller.dart`

```dart


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

```
###  Path: `/lib/app/modules/dashboard/views/dashboard_view.dart`

```dart
import 'dart:ui';
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          extendBody: true, // 🔥 penting agar blur tembus body
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: _glassBottomNavbar(),
        ));
  }

  Widget _glassBottomNavbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.50),
            border: Border(
              top: BorderSide(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.secondary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.brush),
                label: 'Service',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_online),
                label: 'Booking',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
###  Path: `/lib/app/modules/home/bindings/home_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    HomeBinding().dependencies();
  }
}

```
###  Path: `/lib/app/modules/home/controllers/home_controller.dart`

```dart

import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void tombol(){
    Get.offNamed(Routes.BOOKING);
  }

  void toProfile(){
    Get.toNamed(Routes.PROFILE);
  }
}

```
###  Path: `/lib/app/modules/home/views/home_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/categoryItems.dart';
import 'package:alfiyah_apps/app/components/mainCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('HomeView', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          Icon(Icons.search_outlined, color: AppColors.primary),
          Gap(20),
          CircleAvatar(
            backgroundColor: AppColors.secondary,
            child: Icon(Icons.person_2_outlined),
          ),
          Gap(20),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        categoryItem(onTap: controller.tombol),
                        Gap(20),
                      ],
                    );
                  },
                ),
              ),
              Gap(32),
              mainCard(),
              Gap(32),
              Text('Akses Cepat', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300),),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.school_outlined,size: 50,)
                      ],
                    ),
                  );
                },
              ),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/profile/bindings/profile_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}

```
###  Path: `/lib/app/modules/profile/controllers/profile_controller.dart`

```dart
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

```
###  Path: `/lib/app/modules/profile/views/profile_view.dart`

```dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/routes/app_pages.dart`

```dart
import 'package:get/get.dart';

import '../modules/Services/bindings/services_binding.dart';
import '../modules/Services/views/services_view.dart';
import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
  ];
}

```
###  Path: `/lib/app/routes/app_routes.dart`

```dart
part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const BOOKING = _Paths.BOOKING;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const PROFILE = _Paths.PROFILE;
  static const SERVICES = _Paths.SERVICES;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BOOKING = '/booking';
  static const DASHBOARD = '/dashboard';
  static const PROFILE = '/profile';
  static const SERVICES = '/services';
}

```
###  Path: `/lib/main.dart`

```dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

```