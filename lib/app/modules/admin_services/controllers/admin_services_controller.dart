import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminServicesController extends GetxController {
  final packages = [
    {
      'id': 1,
      'name': 'Makeup Party',
      'description': 'Party-ready glam makeup',
      'service_types': [
        {
          'id': 1,
          'name': 'Premium Party',
          'description': 'Premium party look with styling',
          'price': '750000.00',
        },
        {
          'id': 2,
          'name': 'Exclusive Party',
          'description': 'Exclusive party look with luxury products',
          'price': '1200000.00',
        },
      ],
    },
    {
      'id': 2,
      'name': 'Makeup Wisuda',
      'description': 'Graduation makeup packages',
      'service_types': [
        {
          'id': 3,
          'name': 'Premium Wisuda',
          'description': 'Premium graduation makeup',
          'price': '850000.00',
        },
      ],
    },
  ].obs;

  final packageNameController = TextEditingController();
  final packageDescController = TextEditingController();
  final serviceNameController = TextEditingController();
  final serviceDescController = TextEditingController();
  final servicePriceController = TextEditingController();

  void showAddPackageDialog() {
    packageNameController.clear();
    packageDescController.clear();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Package Baru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: packageNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Package',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: packageDescController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: addPackage,
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addPackage() {
    if (packageNameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama package harus diisi');
      return;
    }

    // TODO: Call API
    packages.add({
      'id': packages.length + 1,
      'name': packageNameController.text,
      'description': packageDescController.text,
      'service_types': [],
    });

    Get.back();
    Get.snackbar('Berhasil', 'Package berhasil ditambahkan');
  }

  void showAddServiceTypeDialog(int packageId) {
    serviceNameController.clear();
    serviceDescController.clear();
    servicePriceController.clear();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Service Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: serviceNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Layanan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: serviceDescController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: servicePriceController,
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                  prefixText: 'Rp ',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => addServiceType(packageId),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addServiceType(int packageId) {
    if (serviceNameController.text.isEmpty || servicePriceController.text.isEmpty) {
      Get.snackbar('Error', 'Nama dan harga harus diisi');
      return;
    }

    // TODO: Call API
    final packageIndex = packages.indexWhere((p) => p['id'] == packageId);
    if (packageIndex != -1) {
      final serviceTypes = packages[packageIndex]['service_types'] as List;
      serviceTypes.add({
        'id': serviceTypes.length + 1,
        'name': serviceNameController.text,
        'description': serviceDescController.text,
        'price': servicePriceController.text,
      });
      packages.refresh();
    }

    Get.back();
    Get.snackbar('Berhasil', 'Service type berhasil ditambahkan');
  }

  @override
  void onClose() {
    packageNameController.dispose();
    packageDescController.dispose();
    serviceNameController.dispose();
    serviceDescController.dispose();
    servicePriceController.dispose();
    super.onClose();
  }
}
