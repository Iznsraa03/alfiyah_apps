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
