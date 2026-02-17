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
