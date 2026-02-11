import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'Loading...'.obs;
  final userEmail = ''.obs;
  final userPhone = '-'.obs;
  final userAddress = '-'.obs;
  final userRole = ''.obs;

  final menuItems = [
    {
      'title': 'Edit Profile',
      'subtitle': 'Ubah data pribadi kamu',
      'icon': 'edit',
    },
    {
      'title': 'Pengaturan',
      'subtitle': 'Kelola preferensi aplikasi',
      'icon': 'settings',
    },
    {
      'title': 'Bantuan',
      'subtitle': 'FAQ dan dukungan',
      'icon': 'help',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    final userData = await StorageService.getUserData();
    if (userData['name'] != null) {
      userName.value = userData['name'] as String;
      userEmail.value = userData['email'] as String;
      userRole.value = userData['role'] as String;
      
      // Load full profile from API if needed
      // For now just use storage data
    }
  }

  void logout() async {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Apakah kamu yakin ingin keluar?',
      textConfirm: 'Ya',
      textCancel: 'Batal',
      onConfirm: () async {
        await AuthService.logout();
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }
}
