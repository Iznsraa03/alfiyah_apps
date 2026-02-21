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

  static Future<Map<String, dynamic>> createPackage({
    required String name,
    String? description,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.packages}');
      final token = await StorageService.getToken();
      final body = {
        'name': name,
        'description': description?.isEmpty == true ? null : description,
      };

      developer.log('🔵 Create Package Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');
      developer.log('Body: ${json.encode(body)}', name: 'ServiceService');

      final response = await http.post(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Create Package Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal menambahkan package',
        };
      }
    } catch (e) {
      developer.log('❌ Create Package Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  static Future<Map<String, dynamic>> updatePackage({
    required int packageId,
    String? name,
    String? description,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.packages}/$packageId');
      final token = await StorageService.getToken();
      final body = {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
      };

      developer.log('🔵 Update Package Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');
      developer.log('Body: ${json.encode(body)}', name: 'ServiceService');

      final response = await http.patch(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Update Package Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memperbarui package',
        };
      }
    } catch (e) {
      developer.log('❌ Update Package Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  static Future<Map<String, dynamic>> deletePackage({
    required int packageId,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.packages}/$packageId');
      final token = await StorageService.getToken();

      developer.log('🔵 Delete Package Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');

      final response = await http.delete(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Delete Package Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 204) {
        return {
          'success': true,
        };
      } else {
        final error = response.body.isEmpty ? null : json.decode(response.body);
        return {
          'success': false,
          'message': error?['detail'] ?? 'Gagal menghapus package',
        };
      }
    } catch (e) {
      developer.log('❌ Delete Package Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  static Future<Map<String, dynamic>> createServiceType({
    required int packageId,
    required String name,
    String? description,
    required double price,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.serviceTypes}');
      final token = await StorageService.getToken();
      final body = {
        'package_id': packageId,
        'name': name,
        'description': description?.isEmpty == true ? null : description,
        'price': price,
      };

      developer.log('🔵 Create Service Type Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');
      developer.log('Body: ${json.encode(body)}', name: 'ServiceService');

      final response = await http.post(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Create Service Type Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal menambahkan service type',
        };
      }
    } catch (e) {
      developer.log('❌ Create Service Type Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  static Future<Map<String, dynamic>> updateServiceType({
    required int serviceTypeId,
    String? name,
    String? description,
    double? price,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.serviceTypes}/$serviceTypeId');
      final token = await StorageService.getToken();
      final body = {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (price != null) 'price': price,
      };

      developer.log('🔵 Update Service Type Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');
      developer.log('Body: ${json.encode(body)}', name: 'ServiceService');

      final response = await http.patch(
        url,
        headers: ApiConfig.getHeaders(token: token),
        body: json.encode(body),
      );

      developer.log('🔵 Update Service Type Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = json.decode(response.body);
        return {
          'success': false,
          'message': error['detail'] ?? 'Gagal memperbarui service type',
        };
      }
    } catch (e) {
      developer.log('❌ Update Service Type Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  static Future<Map<String, dynamic>> deleteServiceType({
    required int serviceTypeId,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.serviceTypes}/$serviceTypeId');
      final token = await StorageService.getToken();

      developer.log('🔵 Delete Service Type Request', name: 'ServiceService');
      developer.log('URL: $url', name: 'ServiceService');

      final response = await http.delete(
        url,
        headers: ApiConfig.getHeaders(token: token),
      );

      developer.log('🔵 Delete Service Type Response', name: 'ServiceService');
      developer.log('Status Code: ${response.statusCode}', name: 'ServiceService');
      developer.log('Body: ${response.body}', name: 'ServiceService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = response.body.isEmpty ? null : json.decode(response.body);
        return {
          'success': false,
          'message': error?['detail'] ?? 'Gagal menghapus service type',
        };
      }
    } catch (e) {
      developer.log('❌ Delete Service Type Error: $e', name: 'ServiceService');
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}
