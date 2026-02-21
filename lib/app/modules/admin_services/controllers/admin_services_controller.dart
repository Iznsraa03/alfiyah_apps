import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminServicesController extends GetxController {
  final packages = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  final packageNameController = TextEditingController();
  final packageDescController = TextEditingController();
  final serviceNameController = TextEditingController();
  final serviceDescController = TextEditingController();
  final servicePriceController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadPackages();
  }

  Future<void> loadPackages() async {
    isLoading.value = true;
    final result = await ServiceService.getPackages();
    isLoading.value = false;

    if (result['success'] == true) {
      packages.value = (result['data'] as List).cast<Map<String, dynamic>>();
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal memuat package');
    }
  }

  void showAddPackageDialog() {
    packageNameController.clear();
    packageDescController.clear();

    Get.dialog(
      _buildPackageDialog(
        title: 'Tambah Package Baru',
        onSave: addPackage,
      ),
    );
  }

  void showEditPackageDialog(Map<String, dynamic> package) {
    packageNameController.text = package['name']?.toString() ?? '';
    packageDescController.text = package['description']?.toString() ?? '';

    Get.dialog(
      _buildPackageDialog(
        title: 'Edit Package',
        onSave: () => updatePackage(package['id'] as int),
      ),
    );
  }

  Widget _buildPackageDialog({
    required String title,
    required VoidCallback onSave,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                  onPressed: onSave,
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addPackage() async {
    if (packageNameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama package harus diisi');
      return;
    }

    final result = await ServiceService.createPackage(
      name: packageNameController.text.trim(),
      description: packageDescController.text.trim(),
    );

    if (result['success'] == true) {
      packages.add(result['data'] as Map<String, dynamic>);
      Get.back();
      Get.snackbar('Berhasil', 'Package berhasil ditambahkan');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal menambahkan package');
    }
  }

  Future<void> updatePackage(int packageId) async {
    if (packageNameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama package harus diisi');
      return;
    }

    final result = await ServiceService.updatePackage(
      packageId: packageId,
      name: packageNameController.text.trim(),
      description: packageDescController.text.trim(),
    );

    if (result['success'] == true) {
      final updated = result['data'] as Map<String, dynamic>;
      final index = packages.indexWhere((item) => item['id'] == packageId);
      if (index != -1) {
        packages[index] = updated;
        packages.refresh();
      }
      Get.back();
      Get.snackbar('Berhasil', 'Package berhasil diperbarui');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal memperbarui package');
    }
  }

  Future<void> deletePackage(int packageId) async {
    final confirmed = await _confirmDelete();
    if (!confirmed) return;

    final result = await ServiceService.deletePackage(packageId: packageId);
    if (result['success'] == true) {
      packages.removeWhere((item) => item['id'] == packageId);
      Get.snackbar('Berhasil', 'Package berhasil dihapus');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal menghapus package');
    }
  }

  void showAddServiceTypeDialog(int packageId) {
    serviceNameController.clear();
    serviceDescController.clear();
    servicePriceController.clear();

    Get.dialog(
      _buildServiceTypeDialog(
        title: 'Tambah Service Type',
        onSave: () => addServiceType(packageId),
      ),
    );
  }

  void showEditServiceTypeDialog(Map<String, dynamic> type) {
    serviceNameController.text = type['name']?.toString() ?? '';
    serviceDescController.text = type['description']?.toString() ?? '';
    servicePriceController.text = (type['price'] ?? '').toString();

    Get.dialog(
      _buildServiceTypeDialog(
        title: 'Edit Service Type',
        onSave: () => updateServiceType(type['id'] as int),
      ),
    );
  }

  Widget _buildServiceTypeDialog({
    required String title,
    required VoidCallback onSave,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                  onPressed: onSave,
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addServiceType(int packageId) async {
    if (serviceNameController.text.isEmpty || servicePriceController.text.isEmpty) {
      Get.snackbar('Error', 'Nama dan harga harus diisi');
      return;
    }

    final price = _parsePrice(servicePriceController.text);
    if (price == null) {
      Get.snackbar('Error', 'Harga tidak valid');
      return;
    }

    final result = await ServiceService.createServiceType(
      packageId: packageId,
      name: serviceNameController.text.trim(),
      description: serviceDescController.text.trim(),
      price: price,
    );

    if (result['success'] == true) {
      final updatedPackage = result['data'] as Map<String, dynamic>;
      _replacePackage(updatedPackage);
      Get.back();
      Get.snackbar('Berhasil', 'Service type berhasil ditambahkan');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal menambahkan service type');
    }
  }

  Future<void> updateServiceType(int serviceTypeId) async {
    if (serviceNameController.text.isEmpty || servicePriceController.text.isEmpty) {
      Get.snackbar('Error', 'Nama dan harga harus diisi');
      return;
    }

    final price = _parsePrice(servicePriceController.text);
    if (price == null) {
      Get.snackbar('Error', 'Harga tidak valid');
      return;
    }

    final result = await ServiceService.updateServiceType(
      serviceTypeId: serviceTypeId,
      name: serviceNameController.text.trim(),
      description: serviceDescController.text.trim(),
      price: price,
    );

    if (result['success'] == true) {
      final updatedPackage = result['data'] as Map<String, dynamic>;
      _replacePackage(updatedPackage);
      Get.back();
      Get.snackbar('Berhasil', 'Service type berhasil diperbarui');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal memperbarui service type');
    }
  }

  Future<void> deleteServiceType(int serviceTypeId) async {
    final confirmed = await _confirmDelete();
    if (!confirmed) return;

    final result = await ServiceService.deleteServiceType(serviceTypeId: serviceTypeId);
    if (result['success'] == true) {
      final updatedPackage = result['data'] as Map<String, dynamic>;
      _replacePackage(updatedPackage);
      Get.snackbar('Berhasil', 'Service type berhasil dihapus');
    } else {
      Get.snackbar('Error', result['message'] ?? 'Gagal menghapus service type');
    }
  }

  void _replacePackage(Map<String, dynamic> updatedPackage) {
    final index = packages.indexWhere((item) => item['id'] == updatedPackage['id']);
    if (index != -1) {
      packages[index] = updatedPackage;
      packages.refresh();
    }
  }

  Future<bool> _confirmDelete() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus item ini?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  double? _parsePrice(String raw) {
    final sanitized = raw.replaceAll('.', '').replaceAll(',', '').trim();
    return double.tryParse(sanitized);
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
