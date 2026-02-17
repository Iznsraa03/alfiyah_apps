import 'dart:async';
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  static const _refreshInterval = Duration(seconds: 5);

  final searchQuery = ''.obs;
  final isLoading = false.obs;

  final packages = <Map<String, dynamic>>[].obs;
  Timer? _refreshTimer;

  // Sample data (akan diganti dengan API)
  // final _samplePackages = [
  //   {
  //     'id': 1,
  //     'name': 'Makeup Party',
  //     'description': 'Party-ready glam makeup',
  //     'service_types': [
  //       {
  //         'id': 1,
  //         'name': 'Premium Party',
  //         'description': 'Premium party look with styling',
  //         'price': '750000.00',
  //       },
  //       {
  //         'id': 2,
  //         'name': 'Exclusive Party',
  //         'description': 'Exclusive party look with luxury products',
  //         'price': '1200000.00',
  //       },
  //       {
  //         'id': 5,
  //         'name': 'Reguler Party',
  //         'description':
  //             'Untuk Pesta, Foto Ijazah & Ramah-Tamah. Belum termasuk soflens & transport.',
  //         'price': '200000.00',
  //       },
  //     ],
  //   },
  //   {
  //     'id': 2,
  //     'name': 'Makeup Wisuda',
  //     'description': 'Graduation makeup packages',
  //     'service_types': [
  //       {
  //         'id': 3,
  //         'name': 'Premium Wisuda',
  //         'description': 'Premium graduation makeup',
  //         'price': '850000.00',
  //       },
  //       {
  //         'id': 4,
  //         'name': 'Exclusive Wisuda',
  //         'description': 'Exclusive graduation makeup',
  //         'price': '1350000.00',
  //       },
  //       {
  //         'id': 6,
  //         'name': 'Paket Ramah Tamah & Wisuda Premium',
  //         'description':
  //             'Sudah termasuk akomodasi Hotel (jika open room), Hijab do, pemasangan toga. Belum termasuk soflens. Hairdo 120-150k oleh tim. Tersedia soflens 50k (bebas pilih warna).',
  //         'price': '550000.00',
  //       },
  //       {
  //         'id': 7,
  //         'name': 'Paket Ramah Tamah & Wisuda Exclusive',
  //         'description':
  //             'Free Hijabdo & Soflens, pemasangan toga. Hairdo 120-150k oleh tim.',
  //         'price': '700000.00',
  //       },
  //     ],
  //   },
  //   {
  //     'id': 3,
  //     'name': 'Makeup Lamaran',
  //     'description': 'Engagement makeup services',
  //     'service_types': [
  //       {
  //         'id': 8,
  //         'name': 'Exclusive Engagement',
  //         'description': 'Belum termasuk transport.',
  //         'price': '500000.00',
  //       },
  //       {
  //         'id': 9,
  //         'name': 'Reguler Engagement',
  //         'description': 'Belum termasuk transport.',
  //         'price': '400000.00',
  //       },
  //       {
  //         'id': 10,
  //         'name': 'Prewedding',
  //         'description':
  //             'Pemasangan attire 50k. Free softlens & hijab do. Belum termasuk transport.',
  //         'price': '400000.00',
  //       },
  //     ],
  //   },
  // ];

  List<Map<String, dynamic>> get filteredPackages {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) {
      return packages;
    }
    return packages
        .map((package) {
          final name = (package['name'] as String).toLowerCase();
          final description = (package['description'] as String).toLowerCase();
          final types = (package['service_types'] as List)
              .cast<Map<String, dynamic>>();
          final filteredTypes = types.where((type) {
            final typeName = (type['name'] as String).toLowerCase();
            final typeDesc = (type['description'] as String).toLowerCase();
            return typeName.contains(query) || typeDesc.contains(query);
          }).toList();

          final matchesPackage =
              name.contains(query) || description.contains(query);
          if (matchesPackage) {
            return {...package, 'service_types': types};
          }

          if (filteredTypes.isNotEmpty) {
            return {...package, 'service_types': filteredTypes};
          }

          return null;
        })
        .whereType<Map<String, dynamic>>()
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    loadPackages();
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(_refreshInterval, (_) {
      loadPackages();
    });
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }

  void loadPackages() async {
    isLoading.value = true;

    final result = await ServiceService.getPackages();

    isLoading.value = false;

    if (result['success'] == true) {
      final data = result['data'] as List;
      packages.value = data.cast<Map<String, dynamic>>();
    } else {
      Get.snackbar(
        'Error',
        result['message'] ?? 'Gagal memuat paket layanan',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void toDetailPage({required Map<String, Map<String, dynamic>> arguments}) {
    Get.toNamed(
      Routes.SERVICE_DETAIL,
    );
  }
}
