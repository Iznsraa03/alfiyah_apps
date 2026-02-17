# Project structure overview
```
// Structure of documents
└── lib/
    └── app/
        ├── Utils/
        │   ├── app_colors.dart
        ├── components/
        │   ├── bookingCard.dart
        │   ├── mainCard.dart
        │   ├── priorityBadge.dart
        │   ├── quickAccessCard.dart
        │   ├── servicePackageCard.dart
        │   ├── serviceTypeCard.dart
        ├── data/
        │   ├── services/
        │   │   └── api_config.dart
        │   │   └── auth_service.dart
        │   │   └── booking_service.dart
        │   │   └── segment_service.dart
        │   │   └── service_service.dart
        │   │   └── storage_service.dart
        ├── modules/
        │   ├── Services/
        │   │   ├── bindings/
        │   │   │   ├── services_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── services_controller.dart
        │   │   ├── views/
        │   │   │   └── services_view.dart
        │   ├── admin_booking_detail/
        │   │   ├── bindings/
        │   │   │   ├── admin_booking_detail_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── admin_booking_detail_controller.dart
        │   │   ├── views/
        │   │   │   └── admin_booking_detail_view.dart
        │   ├── admin_home/
        │   │   ├── bindings/
        │   │   │   ├── admin_home_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── admin_home_controller.dart
        │   │   ├── views/
        │   │   │   └── admin_home_view.dart
        │   ├── admin_segments/
        │   │   ├── bindings/
        │   │   │   ├── admin_segments_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── admin_segments_controller.dart
        │   │   ├── views/
        │   │   │   └── admin_segments_view.dart
        │   ├── admin_services/
        │   │   ├── bindings/
        │   │   │   ├── admin_services_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── admin_services_controller.dart
        │   │   ├── views/
        │   │   │   └── admin_services_view.dart
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
        │   ├── edit_profile/
        │   │   ├── bindings/
        │   │   │   ├── edit_profile_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── edit_profile_controller.dart
        │   │   ├── views/
        │   │   │   └── edit_profile_view.dart
        │   ├── home/
        │   │   ├── bindings/
        │   │   │   ├── home_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── home_controller.dart
        │   │   ├── views/
        │   │   │   └── home_view.dart
        │   ├── login/
        │   │   ├── bindings/
        │   │   │   ├── login_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── login_controller.dart
        │   │   ├── views/
        │   │   │   └── login_view.dart
        │   ├── profile/
        │   │   ├── bindings/
        │   │   │   ├── profile_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── profile_controller.dart
        │   │   ├── views/
        │   │   │   └── profile_view.dart
        │   ├── register/
        │   │   ├── bindings/
        │   │   │   ├── register_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── register_controller.dart
        │   │   ├── views/
        │   │   │   └── register_view.dart
        │   ├── service_detail/
        │   │   ├── bindings/
        │   │   │   ├── service_detail_binding.dart
        │   │   ├── controllers/
        │   │   │   ├── service_detail_controller.dart
        │   │   ├── views/
        │   │   │   └── service_detail_view.dart
        │   ├── welcome/
        │   │   └── bindings/
        │   │       ├── welcome_binding.dart
        │   │   └── controllers/
        │   │       ├── welcome_controller.dart
        │   │   └── views/
        │   │       └── welcome_view.dart
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
###  Path: `/lib/app/components/bookingCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget bookingCard({
  required String title,
  required String status,
  required String date,
  required String clientCount,
  required String price,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.primary.withValues(alpha: 0.12),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            Icon(Icons.event, size: 16, color: AppColors.primary),
            const Gap(8),
            Text(date, style: const TextStyle(fontSize: 12)),
            const Gap(16),
            Icon(Icons.people_outline, size: 16, color: AppColors.primary),
            const Gap(8),
            Text(clientCount, style: const TextStyle(fontSize: 12)),
          ],
        ),
        const Gap(12),
        Text(
          price,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}

```
###  Path: `/lib/app/components/mainCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

Container mainCard({required void Function()? onPressed}) {
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
                    onPressed: onPressed,
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
###  Path: `/lib/app/components/priorityBadge.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget priorityBadge(String segment) {
  Color color;
  String label;

  switch (segment.toLowerCase()) {
    case 'high':
      color = Colors.red;
      label = 'High Priority';
      break;
    case 'medium':
      color = Colors.orange;
      label = 'Medium Priority';
      break;
    case 'low':
      color = Colors.green;
      label = 'Low Priority';
      break;
    default:
      color = AppColors.primary;
      label = segment;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    ),
  );
}

Widget monetaryBadge(String level) {
  Color color;
  IconData icon;

  switch (level.toLowerCase()) {
    case 'vip':
      color = Colors.purple;
      icon = Icons.diamond;
      break;
    case 'premium':
      color = Colors.amber;
      icon = Icons.star;
      break;
    default:
      color = Colors.grey;
      icon = Icons.person;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Text(
          level.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    ),
  );
}

Widget urgencyBadge(String urgency) {
  Color color;
  
  switch (urgency.toLowerCase()) {
    case 'urgent':
      color = Colors.red;
      break;
    case 'soon':
      color = Colors.orange;
      break;
    default:
      color = Colors.blue;
  }

  return Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

```
###  Path: `/lib/app/components/quickAccessCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget quickAccessCard({
  required String title,
  required String subtitle,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.15),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const Gap(16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

```
###  Path: `/lib/app/components/servicePackageCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget servicePackageCard({
  required String name,
  required String description,
  required int totalTypes,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.secondary.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: AppColors.primary.withValues(alpha: 0.12),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.layers_outlined, color: AppColors.primary),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(6),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$totalTypes jenis',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

```
###  Path: `/lib/app/components/serviceTypeCard.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

String _formatRupiah(String rawPrice) {
  final parsed = double.tryParse(rawPrice) ?? 0;
  final value = parsed.round();
  final digits = value.toString().split('');
  final buffer = StringBuffer('Rp ');
  for (var i = 0; i < digits.length; i++) {
    final reverseIndex = digits.length - i;
    buffer.write(digits[i]);
    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write('.');
    }
  }
  return buffer.toString();
}

Widget serviceTypeCard({
  required String name,
  required String description,
  required String price,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
            const Gap(12),
            Text(
              _formatRupiah(price),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

```
###  Path: `/lib/app/data/services/api_config.dart`

```dart
class ApiConfig {
  // Base URL - sesuaikan dengan backend kamu
  static const String baseUrl = 'http://localhost:8000';
  
  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String packages = '/services/packages';
  static const String serviceTypes = '/services/types';
  static const String bookings = '/bookings/';
  static const String myBookings = '/bookings/me';
  static const String segments = '/segments/';
  
  // Headers
  static Map<String, String> getHeaders({String? token}) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    
    return headers;
  }
  
  static Map<String, String> getFormHeaders({String? token}) {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
    
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    
    return headers;
  }
}

```
###  Path: `/lib/app/data/services/auth_service.dart`

```dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';

class AuthService {
  // Login
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.login}');
      
      developer.log('🔵 Login Request', name: 'AuthService');
      developer.log('URL: $url', name: 'AuthService');
      developer.log('Email: $email', name: 'AuthService');
      
      // Login endpoint menggunakan form-urlencoded
      final response = await http.post(
        url,
        headers: ApiConfig.getFormHeaders(),
        body: {
          'username': email, // API expects 'username' field
          'password': password,
        },
      );

      developer.log('🔵 Login Response', name: 'AuthService');
      developer.log('Status Code: ${response.statusCode}', name: 'AuthService');
      developer.log('Body: ${response.body}', name: 'AuthService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['access_token'] as String;
        
        developer.log('✅ Login Success - Token received', name: 'AuthService');
        
        // Get user info from token (decode JWT) atau call /users/me
        final userData = await _getUserInfo(token);
        
        developer.log('✅ User Info received: ${userData['name']} (${userData['role']})', name: 'AuthService');
        
        // Save to local storage
        await StorageService.saveAuthData(
          token: token,
          userId: userData['id'],
          userName: userData['name'],
          userEmail: userData['email'],
          userRole: userData['role'],
        );
        
        developer.log('✅ Auth data saved to storage', name: 'AuthService');
        
        return {
          'success': true,
          'token': token,
          'user': userData,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Login Failed: ${error['detail']}', name: 'AuthService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Login gagal',
        };
      }
    } catch (e) {
      developer.log('❌ Login Error: $e', name: 'AuthService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Register
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String? address,
    String? phoneNumber,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.register}');
      
      final body = {
        'name': name,
        'email': email,
        'password': password,
        if (address != null) 'address': address,
        if (phoneNumber != null) 'phone_number': phoneNumber,
      };

      developer.log('🔵 Register Request', name: 'AuthService');
      developer.log('URL: $url', name: 'AuthService');
      developer.log('Body: ${json.encode(body)}', name: 'AuthService');

      final response = await http.post(
        url,
        headers: ApiConfig.getHeaders(),
        body: json.encode(body),
      );

      developer.log('🔵 Register Response', name: 'AuthService');
      developer.log('Status Code: ${response.statusCode}', name: 'AuthService');
      developer.log('Body: ${response.body}', name: 'AuthService');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        developer.log('✅ Register Success: ${data['email']}', name: 'AuthService');
        return {
          'success': true,
          'user': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Register Failed: ${error['detail']}', name: 'AuthService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Registrasi gagal',
        };
      }
    } catch (e) {
      developer.log('❌ Register Error: $e', name: 'AuthService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Get user info from token
  static Future<Map<String, dynamic>> _getUserInfo(String token) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/auth/me');
      
      developer.log('🔵 Get User Info Request', name: 'AuthService');
      developer.log('URL: $url', name: 'AuthService');
      
      final response = await http.get(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Get User Info Response', name: 'AuthService');
      developer.log('Status Code: ${response.statusCode}', name: 'AuthService');
      developer.log('Body: ${response.body}', name: 'AuthService');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        developer.log('❌ Failed to get user info', name: 'AuthService');
        throw Exception('Failed to get user info');
      }
    } catch (e) {
      developer.log('❌ Get User Info Error: $e', name: 'AuthService');
      throw Exception('Failed to get user info: $e');
    }
  }

  // Update Profile
  static Future<Map<String, dynamic>> updateProfile({
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
  }) async {
    try {
      final token = await StorageService.getToken();
      final url = Uri.parse('${ApiConfig.baseUrl}/auth/me');
      
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (email != null) body['email'] = email;
      if (address != null) body['address'] = address;
      if (phoneNumber != null) body['phone_number'] = phoneNumber;

      developer.log('🔵 Update Profile Request', name: 'AuthService');
      developer.log('URL: $url', name: 'AuthService');
      developer.log('Body: ${json.encode(body)}', name: 'AuthService');

      final response = await http.patch(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Update Profile Response', name: 'AuthService');
      developer.log('Status Code: ${response.statusCode}', name: 'AuthService');
      developer.log('Body: ${response.body}', name: 'AuthService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Update storage with new data
        await StorageService.saveAuthData(
          token: token!,
          userId: data['id'],
          userName: data['name'],
          userEmail: data['email'],
          userRole: data['role'],
        );
        
        developer.log('✅ Profile updated successfully', name: 'AuthService');
        return {
          'success': true,
          'user': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Update Profile Failed: ${error['detail']}', name: 'AuthService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal update profile',
        };
      }
    } catch (e) {
      developer.log('❌ Update Profile Error: $e', name: 'AuthService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Logout
  static Future<void> logout() async {
    await StorageService.clearAuthData();
  }
}

```
###  Path: `/lib/app/data/services/booking_service.dart`

```dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';

class BookingService {
  // Get all bookings (admin only)
  static Future<Map<String, dynamic>> getAllBookings() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.bookings}');
      final token = await StorageService.getToken();
      
      developer.log('🔵 Get All Bookings Request', name: 'BookingService');
      developer.log('URL: $url', name: 'BookingService');
      
      final response = await http.get(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Get All Bookings Response', name: 'BookingService');
      developer.log('Status Code: ${response.statusCode}', name: 'BookingService');
      developer.log('Body: ${response.body}', name: 'BookingService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        developer.log('✅ All bookings loaded: ${data.length} items', name: 'BookingService');
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Failed to load all bookings: ${error['detail']}', name: 'BookingService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memuat booking',
        };
      }
    } catch (e) {
      developer.log('❌ Get All Bookings Error: $e', name: 'BookingService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Get user bookings
  static Future<Map<String, dynamic>> getMyBookings() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.myBookings}');
      final token = await StorageService.getToken();
      
      developer.log('🔵 Get My Bookings Request', name: 'BookingService');
      developer.log('URL: $url', name: 'BookingService');
      
      final response = await http.get(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Get My Bookings Response', name: 'BookingService');
      developer.log('Status Code: ${response.statusCode}', name: 'BookingService');
      developer.log('Body: ${response.body}', name: 'BookingService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        developer.log('✅ Bookings loaded: ${data.length} items', name: 'BookingService');
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Failed to load bookings: ${error['detail']}', name: 'BookingService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memuat booking',
        };
      }
    } catch (e) {
      developer.log('❌ Get My Bookings Error: $e', name: 'BookingService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Create booking
  static Future<Map<String, dynamic>> createBooking({
    required int serviceTypeId,
    required DateTime tanggalAcara,
    required int jumlahClient,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.bookings}');
      final token = await StorageService.getToken();
      
      final body = {
        'service_type_id': serviceTypeId,
        'tanggal_acara': tanggalAcara.toIso8601String(),
        'jumlah_client': jumlahClient,
      };

      developer.log('🔵 Create Booking Request', name: 'BookingService');
      developer.log('URL: $url', name: 'BookingService');
      developer.log('Body: ${json.encode(body)}', name: 'BookingService');

      final response = await http.post(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Create Booking Response', name: 'BookingService');
      developer.log('Status Code: ${response.statusCode}', name: 'BookingService');
      developer.log('Body: ${response.body}', name: 'BookingService');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        developer.log('✅ Booking created: ID ${data['id']}', name: 'BookingService');
        return {
          'success': true,
          'booking': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Create Booking Failed: ${error['detail']}', name: 'BookingService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal membuat booking',
        };
      }
    } catch (e) {
      developer.log('❌ Create Booking Error: $e', name: 'BookingService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  // Update booking status (admin only)
  static Future<Map<String, dynamic>> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/bookings/$bookingId');
      final token = await StorageService.getToken();
      
      final body = {'status': status};

      developer.log('🔵 Update Booking Status Request', name: 'BookingService');
      developer.log('URL: $url', name: 'BookingService');
      developer.log('Body: ${json.encode(body)}', name: 'BookingService');

      final response = await http.patch(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Update Booking Status Response', name: 'BookingService');
      developer.log('Status Code: ${response.statusCode}', name: 'BookingService');
      developer.log('Body: ${response.body}', name: 'BookingService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        developer.log('✅ Booking status updated', name: 'BookingService');
        return {
          'success': true,
          'booking': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Update Status Failed: ${error['detail']}', name: 'BookingService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal update status',
        };
      }
    } catch (e) {
      developer.log('❌ Update Booking Status Error: $e', name: 'BookingService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}

```
###  Path: `/lib/app/data/services/segment_service.dart`

```dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';

class SegmentService {
  static Future<Map<String, dynamic>> getSegments() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.segments}');
      final token = await StorageService.getToken();

      developer.log('🔵 Get Segments Request', name: 'SegmentService');
      developer.log('URL: $url', name: 'SegmentService');

      final response = await http.get(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Get Segments Response', name: 'SegmentService');
      developer.log('Status Code: ${response.statusCode}', name: 'SegmentService');
      developer.log('Body: ${response.body}', name: 'SegmentService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        developer.log('✅ Segments loaded: ${data.length} items', name: 'SegmentService');
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Failed to load segments: ${error['detail']}', name: 'SegmentService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memuat segmentasi',
        };
      }
    } catch (e) {
      developer.log('❌ Get Segments Error: $e', name: 'SegmentService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}

```
###  Path: `/lib/app/data/services/service_service.dart`

```dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';

class ServiceService {
  // Get all packages with service types
  static Future<Map<String, dynamic>> getPackages() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.packages}');
      final token = await StorageService.getToken();
      
      developer.log('🔵 Get Packages Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');
      
      final response = await http.get(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Get Packages Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        developer.log('✅ Packages loaded: ${data.length} items', name: 'ServiceService');
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        developer.log('❌ Failed to load packages: ${error['detail']}', name: 'ServiceService');
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memuat paket layanan',
        };
      }
    } catch (e) {
      developer.log('❌ Get Packages Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}

```
###  Path: `/lib/app/data/services/storage_service.dart`

```dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userRoleKey = 'user_role';

  // Save auth data
  static Future<void> saveAuthData({
    required String token,
    required int userId,
    required String userName,
    required String userEmail,
    required String userRole,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setInt(_userIdKey, userId);
    await prefs.setString(_userNameKey, userName);
    await prefs.setString(_userEmailKey, userEmail);
    await prefs.setString(_userRoleKey, userRole);
  }

  // Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Get user role
  static Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey);
  }

  // Get user data
  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getInt(_userIdKey),
      'name': prefs.getString(_userNameKey),
      'email': prefs.getString(_userEmailKey),
      'role': prefs.getString(_userRoleKey),
    };
  }

  // Clear all auth data
  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userRoleKey);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
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
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  final searchQuery = ''.obs;
  final isLoading = false.obs;

  final packages = <Map<String, dynamic>>[].obs;

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

```
###  Path: `/lib/app/modules/Services/views/services_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/servicePackageCard.dart';
import 'package:alfiyah_apps/app/components/serviceTypeCard.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  ServicesView({super.key});

  @override
  final ServicesController controller = Get.find<ServicesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Layanan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search_outlined, color: AppColors.primary),
        //     onPressed: () {},
        //   ),
        //   const Gap(8),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search_outlined, color: AppColors.primary),
                    hintText: 'Cari paket atau layanan',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(24),
              Obx(() {
                final filtered = controller.filteredPackages;
                if (filtered.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: const Text(
                      'Tidak ada layanan yang cocok.',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Paket Populer',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Gap(12),
                    servicePackageCard(
                      name: filtered.first['name'] as String,
                      description: filtered.first['description'] as String,
                      totalTypes: (filtered.first['service_types'] as List)
                          .length,
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Semua Layanan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${filtered.length} paket',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        final package = filtered[index];
                        final types = package['service_types'] as List;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            servicePackageCard(
                              name: package['name'] as String,
                              description: package['description'] as String,
                              totalTypes: types.length,
                            ),
                            const Gap(12),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: types.length,
                              separatorBuilder: (context, index) => const Gap(12),
                              itemBuilder: (context, typeIndex) {
                                final type = types[typeIndex]
                                    as Map<String, dynamic>;
                                return serviceTypeCard(
                                  name: type['name'] as String,
                                  description: type['description'] as String,
                                  price: type['price'] as String,
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.SERVICE_DETAIL,
                                      arguments: {
                                        'serviceType': type,
                                        'package': package,
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const Gap(32),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/admin_booking_detail/bindings/admin_booking_detail_binding.dart`

```dart
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

```
###  Path: `/lib/app/modules/admin_booking_detail/controllers/admin_booking_detail_controller.dart`

```dart
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:get/get.dart';

class AdminBookingDetailController extends GetxController {
  final bookingId = 0.obs;
  final isLoading = false.obs;
  final isLoadingData = false.obs;

  final booking = <String, dynamic>{
    'id': 1,
    'user_id': 12,
    'user_name': 'Sarah Amelia',
    'user_email': 'sarah@example.com',
    'user_phone': '+62 812-3456-7890',
    'service_type_id': 5,
    'service_type': 'Wedding Make Up Premium',
    'package_name': 'Makeup Party',
    'tanggal_booking': '2026-02-10 14:30',
    'tanggal_acara': '2026-02-15 14:00',
    'jumlah_client': 150,
    'price_locked': '12500000.00',
    'status': 'pending',
    'priority_score': 95,
    'priority_segment': 'high',
    'urgency_level': 'urgent',
    'monetary_level': 'vip',
    'updated_priority_at': '2026-02-11 08:00',
  }.obs;

  final availableStatuses = ['pending', 'confirmed', 'completed', 'cancelled'];

  @override
  void onInit() {
    super.onInit();
    developer.log('🔵 AdminBookingDetail onInit', name: 'AdminBookingDetail');
    developer.log('Arguments: ${Get.arguments}', name: 'AdminBookingDetail');
    
    // Get booking data from arguments
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      bookingId.value = args['bookingId'] as int;
      
      if (args.containsKey('bookingData') && args['bookingData'] != null) {
        final data = args['bookingData'] as Map<String, dynamic>;
        booking.value = data;
        developer.log('✅ Booking data loaded from arguments', name: 'AdminBookingDetail');
      } else {
        developer.log('⚠️ No booking data, using sample', name: 'AdminBookingDetail');
      }
    } else {
      developer.log('❌ Invalid arguments', name: 'AdminBookingDetail');
    }
  }

  void updateStatus(String newStatus) async {
    developer.log('🔵 Updating booking status to: $newStatus', name: 'AdminBookingDetail');
    isLoading.value = true;

    final result = await BookingService.updateBookingStatus(
      bookingId: bookingId.value,
      status: newStatus,
    );

    isLoading.value = false;

    if (result['success'] == true) {
      final currentBooking = Map<String, dynamic>.from(booking.value);
      currentBooking['status'] = newStatus;
      booking.value = currentBooking;

      developer.log('✅ Booking status updated successfully', name: 'AdminBookingDetail');
      Get.snackbar(
        'Berhasil',
        'Status booking berhasil diupdate menjadi $newStatus',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      developer.log('❌ Failed to update booking status', name: 'AdminBookingDetail');
      Get.snackbar(
        'Error',
        result['message'] ?? 'Gagal update status',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showStatusDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update Status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ...availableStatuses.map((status) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    status.toUpperCase(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Get.back();
                    updateStatus(status);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/admin_booking_detail/views/admin_booking_detail_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/priorityBadge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_booking_detail_controller.dart';

class AdminBookingDetailView extends GetView<AdminBookingDetailController> {
  const AdminBookingDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Detail Booking',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        final booking = controller.booking;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Customer Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Pelanggan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      _infoRow(Icons.person_outline, (booking['user'] as Map?)?['name'] ?? 'User ${booking['user_id']}'),
                      const Gap(8),
                      _infoRow(Icons.email_outlined, (booking['user'] as Map?)?['email'] ?? '-'),
                      const Gap(8),
                      _infoRow(Icons.phone_outlined, (booking['user'] as Map?)?['phone_number'] ?? '-'),
                    ],
                  ),
                ),
                const Gap(16),
                // Service Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Layanan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      _infoRow(Icons.brush_outlined, 'Service ID: ${booking['service_type_id']}'),
                      const Gap(8),
                      _infoRow(Icons.event, 'Acara: ${booking['tanggal_acara']}'),
                      const Gap(8),
                      _infoRow(Icons.people, '${booking['jumlah_client']} client'),
                      const Gap(8),
                      _infoRow(Icons.attach_money, _formatRupiah(booking['price_locked'] as String)),
                    ],
                  ),
                ),
                const Gap(16),
                // Priority & Segmentation Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Analisis Prioritas',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          const Text(
                            'Priority Score:',
                            style: TextStyle(fontSize: 12),
                          ),
                          const Gap(8),
                          Text(
                            '${booking['priority_score']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          priorityBadge(booking['priority_segment'] as String),
                          monetaryBadge(booking['monetary_level'] as String),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getUrgencyColor(booking['urgency_level'] as String).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Urgency: ${booking['urgency_level']}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: _getUrgencyColor(booking['urgency_level'] as String),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),
                      Text(
                        'Last updated: ${booking['updated_priority_at']}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                // Status Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Status Booking',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking['status'] as String).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              (booking['status'] as String).toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _getStatusColor(booking['status'] as String),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: controller.showStatusDialog,
                        icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                        label: const Text(
                          'Update Status',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const Gap(8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }

  String _formatRupiah(String rawPrice) {
    final parsed = double.tryParse(rawPrice) ?? 0;
    final value = parsed.round();
    final digits = value.toString().split('');
    final buffer = StringBuffer('Rp ');
    for (var i = 0; i < digits.length; i++) {
      final reverseIndex = digits.length - i;
      buffer.write(digits[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  Color _getUrgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case 'urgent':
        return Colors.red;
      case 'soon':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}

```
###  Path: `/lib/app/modules/admin_home/bindings/admin_home_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(
      () => AdminHomeController(),
    );
  }
}

```
###  Path: `/lib/app/modules/admin_home/controllers/admin_home_controller.dart`

```dart
import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  final selectedFilter = 'all'.obs;
  final isLoading = false.obs;
  final serviceTypesMap = <int, Map<String, dynamic>>{}.obs;
  
  final bookings = <Map<String, dynamic>>[].obs;
  
  final _sampleBookings = [
    {
      'id': 1,
      'user_name': 'Sarah Amelia',
      'service_type': 'Wedding Make Up Premium',
      'tanggal_acara': '2026-02-15 14:00',
      'jumlah_client': 150,
      'price_locked': '12500000.00',
      'status': 'pending',
      'priority_score': 95,
      'priority_segment': 'high',
      'urgency_level': 'urgent',
      'monetary_level': 'vip',
    },
    {
      'id': 2,
      'user_name': 'Dina Kartika',
      'service_type': 'Engagement Photo',
      'tanggal_acara': '2026-02-20 10:00',
      'jumlah_client': 2,
      'price_locked': '3200000.00',
      'status': 'confirmed',
      'priority_score': 78,
      'priority_segment': 'medium',
      'urgency_level': 'soon',
      'monetary_level': 'premium',
    },
    {
      'id': 3,
      'user_name': 'Rina Putri',
      'service_type': 'Prewedding Indoor',
      'tanggal_acara': '2026-03-05 09:00',
      'jumlah_client': 2,
      'price_locked': '5750000.00',
      'status': 'pending',
      'priority_score': 62,
      'priority_segment': 'medium',
      'urgency_level': 'upcoming',
      'monetary_level': 'premium',
    },
    {
      'id': 4,
      'user_name': 'Maya Sari',
      'service_type': 'Reguler Party',
      'tanggal_acara': '2026-03-10 15:00',
      'jumlah_client': 1,
      'price_locked': '200000.00',
      'status': 'pending',
      'priority_score': 45,
      'priority_segment': 'low',
      'urgency_level': 'upcoming',
      'monetary_level': 'regular',
    },
  ];

  List<Map<String, dynamic>> get filteredBookings {
    if (selectedFilter.value == 'all') {
      return bookings;
    }
    return bookings.where((b) {
      if (selectedFilter.value == 'vip') {
        return b['monetary_level'] == 'vip';
      }
      return b['priority_segment'] == selectedFilter.value;
    }).toList();
  }

  Map<String, int> get stats {
    return {
      'total': bookings.length,
      'high': bookings.where((b) => b['priority_segment'] == 'high').length,
      'medium': bookings.where((b) => b['priority_segment'] == 'medium').length,
      'low': bookings.where((b) => b['priority_segment'] == 'low').length,
      'vip': bookings.where((b) => b['monetary_level'] == 'vip').length,
      'pending': bookings.where((b) => b['status'] == 'pending').length,
    };
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void goToBookingDetail(int bookingId) {
    developer.log('🔵 Navigating to booking detail ID: $bookingId', name: 'AdminHome');
    
    // Find booking data from list
    final bookingData = bookings.firstWhereOrNull((b) => b['id'] == bookingId);
    
    Get.toNamed(Routes.ADMIN_BOOKING_DETAIL, arguments: {
      'bookingId': bookingId,
      'bookingData': bookingData,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadServiceTypes();
    loadBookings();
  }

  void loadServiceTypes() async {
    developer.log('🔵 Loading service types...', name: 'AdminHome');
    final result = await ServiceService.getPackages();
    if (result['success'] == true) {
      final packages = result['data'] as List;
      for (var package in packages) {
        final serviceTypes = package['service_types'] as List;
        for (var st in serviceTypes) {
          serviceTypesMap[(st as Map)['id'] as int] = st as Map<String, dynamic>;
        }
      }
      developer.log('✅ Service types loaded: ${serviceTypesMap.length} types', name: 'AdminHome');
    } else {
      developer.log('❌ Failed to load service types', name: 'AdminHome');
    }
  }

  void loadBookings() async {
    developer.log('🔵 Loading all bookings (admin)...', name: 'AdminHome');
    isLoading.value = true;
    final result = await BookingService.getAllBookings();
    isLoading.value = false;
    
    if (result['success'] == true) {
      bookings.value = (result['data'] as List).cast<Map<String, dynamic>>();
      developer.log('✅ Bookings loaded: ${bookings.length} items', name: 'AdminHome');
    } else {
      developer.log('❌ Failed to load bookings', name: 'AdminHome');
    }
  }

  String getServiceName(int id) => serviceTypesMap[id]?['name'] ?? 'Service';

  void goToManageServices() {
    Get.toNamed(Routes.ADMIN_SERVICES);
  }

  void goToSegments() {
    Get.toNamed(Routes.ADMIN_SEGMENTS);
  }

  void logOut(){
    Get.offAllNamed(Routes.LOGIN);
  }
}

```
###  Path: `/lib/app/modules/admin_home/views/admin_home_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/priorityBadge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined, color: AppColors.primary),
            onPressed: controller.logOut,
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Summary
              const Text(
                'Ringkasan Hari Ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      'Total',
                      '${controller.stats['total']}',
                      Colors.blue,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _statCard(
                      'Pending',
                      '${controller.stats['pending']}',
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      'High Priority',
                      '${controller.stats['high']}',
                      Colors.red,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _statCard(
                      'VIP',
                      '${controller.stats['vip']}',
                      Colors.purple,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      'Manage Services',
                      Icons.brush_outlined,
                      controller.goToManageServices,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _actionButton(
                      'Segmentasi',
                      Icons.groups_2_outlined,
                      controller.goToSegments,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              // Filter Chips
              const Text(
                'Filter Booking',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _filterChip('Semua', 'all'),
                        const Gap(8),
                        _filterChip('High Priority', 'high'),
                        const Gap(8),
                        _filterChip('Medium Priority', 'medium'),
                        const Gap(8),
                        _filterChip('Low Priority', 'low'),
                        const Gap(8),
                        _filterChip('VIP Only', 'vip'),
                      ],
                    ),
                  )),
              const Gap(16),
              // Booking List
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ));
                }
                
                final bookings = controller.filteredBookings;
                if (bookings.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Tidak ada booking.'),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookings.length,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return _bookingCard(booking);
                  },
                );
              }),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const Gap(8),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterChip(String label, String value) {
    final isSelected = controller.selectedFilter.value == value;
    return GestureDetector(
      onTap: () => controller.setFilter(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _bookingCard(Map<String, dynamic> booking) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => controller.goToBookingDetail(booking['id'] as int),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  urgencyBadge(booking['urgency_level'] as String? ?? 'upcoming'),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      (booking['user'] as Map?)?['name'] ?? 'User ${booking['user_id']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: booking['status'] == 'pending'
                          ? Colors.orange.withValues(alpha: 0.12)
                          : Colors.green.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      booking['status'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: booking['status'] == 'pending'
                            ? Colors.orange
                            : Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(8),
              Text(
                controller.getServiceName(booking['service_type_id'] as int),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              const Gap(8),
              Row(
                children: [
                  Icon(Icons.event, size: 14, color: AppColors.primary),
                  const Gap(4),
                  Expanded(
                    child: Text(
                      booking['tanggal_acara'] as String,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(12),
                  Icon(Icons.people, size: 14, color: AppColors.primary),
                  const Gap(4),
                  Text(
                    '${booking['jumlah_client']} client',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  priorityBadge(booking['priority_segment'] as String),
                  const Gap(8),
                  monetaryBadge(booking['monetary_level'] as String),
                  const Spacer(),
                  Text(
                    'Score: ${booking['priority_score']}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/admin_segments/bindings/admin_segments_binding.dart`

```dart
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

```
###  Path: `/lib/app/modules/admin_segments/controllers/admin_segments_controller.dart`

```dart
import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/data/services/segment_service.dart';
import 'package:get/get.dart';

class AdminSegmentsController extends GetxController {
  final isLoading = false.obs;
  final segments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSegments();
  }

  void loadSegments() async {
    developer.log('🔵 Loading segments...', name: 'AdminSegments');
    isLoading.value = true;
    final result = await SegmentService.getSegments();
    isLoading.value = false;

    if (result['success'] == true) {
      segments.value = (result['data'] as List).cast<Map<String, dynamic>>();
      developer.log('✅ Segments loaded: ${segments.length}', name: 'AdminSegments');
    } else {
      developer.log('❌ Failed to load segments', name: 'AdminSegments');
    }
  }
}

```
###  Path: `/lib/app/modules/admin_segments/views/admin_segments_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_segments_controller.dart';

class AdminSegmentsView extends GetView<AdminSegmentsController> {
  const AdminSegmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Segmentasi Pelanggan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.segments.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('Belum ada data segmentasi.'),
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.segments.length,
          separatorBuilder: (_, __) => const Gap(12),
          itemBuilder: (context, index) {
            final item = controller.segments[index];
            return _segmentCard(item);
          },
        );
      }),
    );
  }

  Widget _segmentCard(Map<String, dynamic> item) {
    final segment = (item['customer_segment'] ?? '-').toString();
    final frequency = (item['frequency'] ?? 0).toString();
    final monetary = (item['monetary'] ?? 0).toString();
    final recency = (item['recency'] ?? 0).toString();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item['name'] ?? '-',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  segment,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(child: _metricItem('Frekuensi', frequency)),
              const Gap(8),
              Expanded(child: _metricItem('Total', monetary)),
              const Gap(8),
              Expanded(child: _metricItem('Recency', recency)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.black.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/admin_services/bindings/admin_services_binding.dart`

```dart
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

```
###  Path: `/lib/app/modules/admin_services/controllers/admin_services_controller.dart`

```dart
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

```
###  Path: `/lib/app/modules/admin_services/views/admin_services_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/admin_services_controller.dart';

class AdminServicesView extends GetView<AdminServicesController> {
  const AdminServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Manage Services',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AppColors.primary),
            onPressed: controller.showAddPackageDialog,
          ),
          const Gap(8),
        ],
      ),
      body: Obx(() {
        if (controller.packages.isEmpty) {
          return const Center(
            child: Text('Belum ada package.'),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Service Package',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Gap(12),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.packages.length,
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    final package = controller.packages[index];
                    return _packageCard(package);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _packageCard(Map<String, dynamic> package) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      package['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      package['description'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${(package['service_types'] as List).length} layanan',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          const Divider(),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Types',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton.icon(
                onPressed: () => controller.showAddServiceTypeDialog(package['id'] as int),
                icon: Icon(Icons.add, size: 16, color: AppColors.primary),
                label: Text(
                  'Tambah',
                  style: TextStyle(fontSize: 12, color: AppColors.primary),
                ),
              ),
            ],
          ),
          const Gap(8),
          if ((package['service_types'] as List).isEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Belum ada service type.',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (package['service_types'] as List).length,
              separatorBuilder: (context, index) => const Gap(8),
              itemBuilder: (context, index) {
                final type = (package['service_types'] as List)[index] as Map<String, dynamic>;
                return _serviceTypeItem(type);
              },
            ),
        ],
      ),
    );
  }

  Widget _serviceTypeItem(Map<String, dynamic> type) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type['name'] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  type['description'] as String,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatRupiah(type['price'] as String),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  String _formatRupiah(String rawPrice) {
    final parsed = double.tryParse(rawPrice) ?? 0;
    final value = parsed.round();
    final digits = value.toString().split('');
    final buffer = StringBuffer('Rp ');
    for (var i = 0; i < digits.length; i++) {
      final reverseIndex = digits.length - i;
      buffer.write(digits[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
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
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:alfiyah_apps/app/data/services/service_service.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final bookings = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final serviceTypesMap = <int, Map<String, dynamic>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadServiceTypes();
    loadBookings();
  }

  void loadServiceTypes() async {
    final result = await ServiceService.getPackages();
    
    if (result['success'] == true) {
      final packages = result['data'] as List;
      
      // Build service types map
      for (var package in packages) {
        final serviceTypes = package['service_types'] as List;
        for (var serviceType in serviceTypes) {
          final st = serviceType as Map<String, dynamic>;
          serviceTypesMap[st['id'] as int] = st;
        }
      }
    }
  }

  void loadBookings() async {
    isLoading.value = true;
    
    final result = await BookingService.getMyBookings();
    
    isLoading.value = false;
    
    if (result['success'] == true) {
      final data = result['data'] as List;
      bookings.value = data.cast<Map<String, dynamic>>();
    } else {
      Get.snackbar(
        'Error',
        result['message'] ?? 'Gagal memuat booking',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  String getServiceName(int serviceTypeId) {
    final serviceType = serviceTypesMap[serviceTypeId];
    return serviceType?['name'] ?? 'Service ID: $serviceTypeId';
  }
}

```
###  Path: `/lib/app/modules/booking/views/booking_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/bookingCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
        elevation: 0,
        title: const Text(
          'Booking Saya',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.primary),
            onPressed: () {},
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(Icons.event_available, color: AppColors.primary),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Jadwal terdekat',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(6),
                          Text(
                            'Wedding Make Up Premium • 11 Feb 2026',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Booking',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${controller.bookings.length} item',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (controller.bookings.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Belum ada booking.'),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.bookings.length,
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    final booking = controller.bookings[index];
                    final serviceTypeId = booking['service_type_id'] as int;
                    
                    return bookingCard(
                      title: controller.getServiceName(serviceTypeId),
                      status: booking['status'] as String,
                      date: booking['tanggal_acara'] as String,
                      clientCount: '${booking['jumlah_client']} client',
                      price: booking['price_locked'] as String,
                    );
                  },
                );
              }),
              const Gap(32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ).copyWith(
                    overlayColor: WidgetStatePropertyAll(
                      AppColors.secondary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Text(
                    'Buat Booking Baru',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Gap(100)
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/dashboard/bindings/dashboard_binding.dart`

```dart
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
   DashboardView({super.key});
  final DashboardController controller = Get.find<DashboardController>();


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
###  Path: `/lib/app/modules/edit_profile/bindings/edit_profile_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}

```
###  Path: `/lib/app/modules/edit_profile/controllers/edit_profile_controller.dart`

```dart
import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    final userData = await StorageService.getUserData();
    if (userData['name'] != null) {
      nameController.text = userData['name'] as String;
      emailController.text = userData['email'] as String;
      // Phone & address will be loaded from API if available
    }
  }

  void saveProfile() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama dan email harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await AuthService.updateProfile(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim().isNotEmpty 
            ? addressController.text.trim() 
            : null,
        phoneNumber: phoneController.text.trim().isNotEmpty 
            ? phoneController.text.trim() 
            : null,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          'Berhasil',
          'Profile berhasil diupdate',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
      } else {
        Get.snackbar(
          'Error',
          result['message'] ?? 'Gagal update profile',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}

```
###  Path: `/lib/app/modules/edit_profile/views/edit_profile_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: AppColors.primary,
                      size: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(32),
            const Text(
              'Informasi Pribadi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
              child: TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person_outline, color: AppColors.primary),
                  hintText: 'Nama Lengkap',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
              child: TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.email_outlined, color: AppColors.primary),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
              child: TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.phone_outlined, color: AppColors.primary),
                  hintText: 'Nomor Telepon',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
              child: TextField(
                controller: controller.addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.home_outlined, color: AppColors.primary),
                  hintText: 'Alamat',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            const Gap(32),
            Obx(() => SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Simpan Perubahan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                )),
          ],
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
  }
}

```
###  Path: `/lib/app/modules/home/controllers/home_controller.dart`

```dart

import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final userName = 'Loading...'.obs;
  final userEmail = ''.obs;
  final userRole = 'Customer'.obs;
  final userLocation = 'Malang, Indonesia'.obs;

  final searchQuery = ''.obs;

  final quickAccessItems = [
    {
      'title': 'Booking',
      'subtitle': 'Pesan layanan',
      'icon': Icons.book_online,
      'route': Routes.BOOKING,
    },
    {
      'title': 'Services',
      'subtitle': 'Lihat paket',
      'icon': Icons.brush,
      'route': Routes.SERVICES,
    },
    {
      'title': 'Profile',
      'subtitle': 'Akun kamu',
      'icon': Icons.person_outline,
      'route': Routes.PROFILE,
    },
  ];

  void tombol() {
    Get.offNamed(Routes.BOOKING);
  }

  void toProfile() {
    Get.toNamed(Routes.PROFILE);
  }

  List<Map<String, dynamic>> get filteredQuickAccessItems {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) {
      return quickAccessItems;
    }
    return quickAccessItems.where((item) {
      final title = (item['title'] as String).toLowerCase();
      final subtitle = (item['subtitle'] as String).toLowerCase();
      return title.contains(query) || subtitle.contains(query);
    }).toList();
  }

  bool get isMainCardVisible {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) {
      return true;
    }
    return query.contains('populer') ||
        query.contains('wedding') ||
        query.contains('make up') ||
        query.contains('makeup');
  }

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
      userRole.value = userData['role'] == 'admin' ? 'Admin' : 'Premium Member';
    }
  }

  void goToQuickAccess(String route) {
    Get.toNamed(route);
  }

  void toServices(){
    Get.toNamed(Routes.SERVICES);
  }
}

```
###  Path: `/lib/app/modules/home/views/home_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/components/mainCard.dart';
import 'package:alfiyah_apps/app/components/quickAccessCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Beranda', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        // actions: [
        //   Icon(Icons.search_outlined, color: AppColors.primary),
        //   const Gap(20),
        //   CircleAvatar(
        //     backgroundColor: AppColors.secondary,
        //     child: Icon(Icons.person_2_outlined, color: AppColors.primary),
        //   ),
        //   const Gap(20),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(4),
                              Text(
                                controller.userRole.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),
                              // const Gap(6),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.location_on_outlined,
                              //       size: 14,
                              //       color: AppColors.primary,
                              //     ),
                              //     const Gap(4),
                              //     Text(
                              //       controller.userLocation.value,
                              //       style: const TextStyle(fontSize: 12),
                              //     ),
                              //   ],
                              // ),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: controller.toProfile,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search_outlined, color: AppColors.primary),
                    hintText: 'Cari layanan, booking, atau profil',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Obx(() {
                if (!controller.isMainCardVisible) {
                  return const SizedBox.shrink();
                }
                return mainCard(onPressed: controller.toServices);
              }),
              const Gap(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Akses Cepat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   'Lihat semua',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: AppColors.primary.withValues(alpha: 0.7),
                  //   ),
                  // ),
                ],
              ),
              const Gap(16),
              Obx(() {
                final items = controller.filteredQuickAccessItems;
                if (items.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: const Text(
                      'Tidak ada hasil akses cepat.',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return quickAccessCard(
                      title: item['title'] as String,
                      subtitle: item['subtitle'] as String,
                      icon: item['icon'] as IconData,
                      onTap: () => controller.goToQuickAccess(
                        item['route'] as String,
                      ),
                    );
                  },
                );
              }),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/login/bindings/login_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

```
###  Path: `/lib/app/modules/login/controllers/login_controller.dart`

```dart
import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    
    try {
      final result = await AuthService.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        final user = result['user'] as Map<String, dynamic>;
        final role = user['role'] as String;

        // Role-based routing
        if (role == 'admin') {
          Get.offAllNamed(Routes.ADMIN_HOME);
        } else {
          Get.offAllNamed(Routes.DASHBOARD);
        }
      } else {
        Get.snackbar(
          'Login Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

```
###  Path: `/lib/app/modules/login/views/login_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(8),
              Text(
                'Masuk untuk melanjutkan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              const Gap(48),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email_outlined, color: AppColors.primary),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline, color: AppColors.primary),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  )),
              const Gap(24),
              Obx(() => SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  )),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.goToRegister,
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
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

```
###  Path: `/lib/app/modules/profile/views/profile_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.value,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(6),
                              Text(
                                controller.userEmail.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withValues(alpha: 0.6),
                                ),
                              ),
                              const Gap(6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 14,
                                    color: AppColors.primary,
                                  ),
                                  const Gap(4),
                                  Text(
                                    controller.userEmail.value,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              const Text(
                'Pengaturan Akun',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              Column(
                children: controller.menuItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      if (item['icon'] == 'edit') {
                        Get.toNamed(Routes.EDIT_PROFILE);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            _resolveIcon(item['icon'] as String),
                            color: AppColors.primary,
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(4),
                              Text(
                                item['subtitle'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    ),
                  );
                }).toList(),
              ),
              const Gap(32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: controller.logout,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Keluar',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

IconData _resolveIcon(String key) {
  switch (key) {
    case 'edit':
      return Icons.edit_outlined;
    case 'settings':
      return Icons.settings_outlined;
    case 'help':
      return Icons.help_outline;
    default:
      return Icons.arrow_forward_ios;
  }
}

```
###  Path: `/lib/app/modules/register/bindings/register_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}

```
###  Path: `/lib/app/modules/register/controllers/register_controller.dart`

```dart
import 'package:alfiyah_apps/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void register() async {
    // Validate
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama, email, dan password harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password minimal 6 karakter',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await AuthService.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        address: addressController.text.trim().isNotEmpty 
            ? addressController.text.trim() 
            : null,
        phoneNumber: phoneController.text.trim().isNotEmpty 
            ? phoneController.text.trim() 
            : null,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          'Berhasil',
          'Akun berhasil dibuat. Silakan login.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          'Registrasi Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}

```
###  Path: `/lib/app/modules/register/views/register_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: controller.goToLogin,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buat Akun',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(8),
              Text(
                'Daftar untuk memulai',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              const Gap(40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outline, color: AppColors.primary),
                    hintText: 'Nama Lengkap',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email_outlined, color: AppColors.primary),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline, color: AppColors.primary),
                        hintText: 'Password (min. 6 karakter)',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  )),
              const Gap(16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.phone_outlined, color: AppColors.primary),
                    hintText: 'Nomor Telepon (opsional)',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                child: TextField(
                  controller: controller.addressController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.home_outlined, color: AppColors.primary),
                    hintText: 'Alamat (opsional)',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              const Gap(32),
              Obx(() => SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  )),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.goToLogin,
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
###  Path: `/lib/app/modules/service_detail/bindings/service_detail_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/service_detail_controller.dart';

class ServiceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailController>(
      () => ServiceDetailController(),
    );
  }
}

```
###  Path: `/lib/app/modules/service_detail/controllers/service_detail_controller.dart`

```dart
import 'dart:developer' as developer;
import 'package:alfiyah_apps/app/data/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class ServiceDetailController extends GetxController {
  final isLoading = false.obs;
  final serviceType = <String, dynamic>{}.obs;
  final packageInfo = <String, dynamic>{}.obs;
  
  final tanggalAcaraController = TextEditingController();
  final jumlahClientController = TextEditingController();
  final selectedDate = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();
    developer.log('🔵 ServiceDetail onInit', name: 'ServiceDetail');
    developer.log('Arguments: ${Get.arguments}', name: 'ServiceDetail');
    
    // Get data from route parameters
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      developer.log('Arguments keys: ${args.keys}', name: 'ServiceDetail');
      
      if (args.containsKey('serviceType') && args.containsKey('package')) {
        serviceType.value = args['serviceType'] as Map<String, dynamic>;
        packageInfo.value = args['package'] as Map<String, dynamic>;
        developer.log('✅ Data loaded: ${serviceType.value['name']}', name: 'ServiceDetail');
      } else {
        developer.log('❌ Missing serviceType or package in arguments', name: 'ServiceDetail');
      }
    } else {
      developer.log('❌ Arguments is null or not Map', name: 'ServiceDetail');
    }
  }

  void selectDate() async {
    final picked = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: DateTime.now().add(const Duration(days: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      ),
    );

    if (picked != null) {
      selectedDate.value = picked;
      tanggalAcaraController.text = 
          '${picked.day}/${picked.month}/${picked.year} ${picked.hour}:${picked.minute.toString().padLeft(2, '0')}';
    }
  }

  void bookService() async {
    if (selectedDate.value == null || jumlahClientController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Tanggal acara dan jumlah client harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final serviceTypeId = serviceType.value['id'] as int;
    final jumlahClient = int.tryParse(jumlahClientController.text);

    if (jumlahClient == null || jumlahClient <= 0) {
      Get.snackbar(
        'Error',
        'Jumlah client harus berupa angka valid',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final result = await BookingService.createBooking(
        serviceTypeId: serviceTypeId,
        tanggalAcara: selectedDate.value!,
        jumlahClient: jumlahClient,
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          'Berhasil',
          'Booking berhasil dibuat!',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        // Navigate to booking list
        Get.offAllNamed(Routes.DASHBOARD);
        Get.toNamed(Routes.BOOKING);
      } else {
        Get.snackbar(
          'Error',
          result['message'] ?? 'Gagal membuat booking',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    tanggalAcaraController.dispose();
    jumlahClientController.dispose();
    super.onClose();
  }
}

```
###  Path: `/lib/app/modules/service_detail/views/service_detail_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/service_detail_controller.dart';

class ServiceDetailView extends GetView<ServiceDetailController> {
  const ServiceDetailView({super.key});

  String _formatRupiah(String rawPrice) {
    final parsed = double.tryParse(rawPrice) ?? 0;
    final value = parsed.round();
    final digits = value.toString().split('');
    final buffer = StringBuffer('Rp ');
    for (var i = 0; i < digits.length; i++) {
      final reverseIndex = digits.length - i;
      buffer.write(digits[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Detail Layanan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        final serviceType = controller.serviceType.value;
        final package = controller.packageInfo.value;

        if (serviceType.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                const SizedBox(height: 16),
                const Text('Data layanan tidak ditemukan'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceType['name'] as String,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      package['name'] as String? ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(16),
                    Text(
                      _formatRupiah(serviceType['price'] as String),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Text(
                        serviceType['description'] as String,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ),
                    const Gap(24),
                    const Text(
                      'Booking Layanan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.12),
                        ),
                      ),
                      child: TextField(
                        controller: controller.tanggalAcaraController,
                        readOnly: true,
                        onTap: controller.selectDate,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.event, color: AppColors.primary),
                          hintText: 'Pilih Tanggal Acara',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.12),
                        ),
                      ),
                      child: TextField(
                        controller: controller.jumlahClientController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.people_outline, color: AppColors.primary),
                          hintText: 'Jumlah Client',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                    const Gap(32),
                    Obx(() => SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.bookService,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: controller.isLoading.value
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Booking Sekarang',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        )),
                    const Gap(24),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

```
###  Path: `/lib/app/modules/welcome/bindings/welcome_binding.dart`

```dart
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}

```
###  Path: `/lib/app/modules/welcome/controllers/welcome_controller.dart`

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfiyah_apps/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  final welcomePages = [
    {
      'image': 'assets/welcome/scadule.svg',
      'title': 'Jadwal Fleksibel',
      'subtitle': 'Booking layanan makeup & photo kapan saja sesuai jadwal kamu.',
    },
    {
      'image': 'assets/welcome/party.svg',
      'title': 'Paket Lengkap',
      'subtitle': 'Dari party, wisuda, hingga wedding. Semua ada di sini.',
    },
    {
      'image': 'assets/welcome/graduation.svg',
      'title': 'Kualitas Terbaik',
      'subtitle': 'Profesional berpengalaman untuk momen spesial kamu.',
    },
  ];

  void nextPage() {
    if (currentPage.value < welcomePages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goToHome();
    }
  }

  void skipToHome() {
    goToHome();
  }

  void goToHome() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

```
###  Path: `/lib/app/modules/welcome/views/welcome_view.dart`

```dart
import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: List.generate(
                          controller.welcomePages.length,
                          (index) => Container(
                            width: controller.currentPage.value == index ? 24 : 8,
                            height: 8,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? AppColors.primary
                                  : AppColors.surface.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: controller.skipToHome,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.currentPage.value = index,
                itemCount: controller.welcomePages.length,
                itemBuilder: (context, index) {
                  final page = controller.welcomePages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Gap(40),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: SvgPicture.asset(
                              page['image'] as String,
                              width: 280,
                              height: 280,
                            ),
                          ),
                        ),
                        const Gap(40),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      page['title'] as String,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Gap(12),
                                    Text(
                                      page['subtitle'] as String,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withValues(alpha: 0.6),
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() => SizedBox(
                                      width: double.infinity,
                                      height: 54,
                                      child: ElevatedButton(
                                        onPressed: controller.nextPage,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Text(
                                          controller.currentPage.value ==
                                                  controller.welcomePages.length - 1
                                              ? "Let's Started"
                                              : 'Continue Now',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const Gap(24),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
import '../modules/admin_booking_detail/bindings/admin_booking_detail_binding.dart';
import '../modules/admin_booking_detail/views/admin_booking_detail_view.dart';
import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_segments/bindings/admin_segments_binding.dart';
import '../modules/admin_segments/views/admin_segments_view.dart';
import '../modules/admin_services/bindings/admin_services_binding.dart';
import '../modules/admin_services/views/admin_services_view.dart';
import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/service_detail/bindings/service_detail_binding.dart';
import '../modules/service_detail/views/service_detail_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

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
      page: () => ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_BOOKING_DETAIL,
      page: () => const AdminBookingDetailView(),
      binding: AdminBookingDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SERVICES,
      page: () => const AdminServicesView(),
      binding: AdminServicesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_DETAIL,
      page: () => const ServiceDetailView(),
      binding: ServiceDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SEGMENTS,
      page: () => const AdminSegmentsView(),
      binding: AdminSegmentsBinding(),
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
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const ADMIN_HOME = _Paths.ADMIN_HOME;
  static const ADMIN_BOOKING_DETAIL = _Paths.ADMIN_BOOKING_DETAIL;
  static const ADMIN_SERVICES = _Paths.ADMIN_SERVICES;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const SERVICE_DETAIL = _Paths.SERVICE_DETAIL;
  static const ADMIN_SEGMENTS = _Paths.ADMIN_SEGMENTS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BOOKING = '/booking';
  static const DASHBOARD = '/dashboard';
  static const PROFILE = '/profile';
  static const SERVICES = '/services';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const ADMIN_HOME = '/admin-home';
  static const ADMIN_BOOKING_DETAIL = '/admin-booking-detail';
  static const ADMIN_SERVICES = '/admin-services';
  static const EDIT_PROFILE = '/edit-profile';
  static const SERVICE_DETAIL = '/service-detail';
  static const ADMIN_SEGMENTS = '/admin-segments';
}

```
###  Path: `/lib/main.dart`

```dart
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alfiyah Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}

```