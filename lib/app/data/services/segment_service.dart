import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:alfiyah_apps/app/data/services/stream_service.dart';

class SegmentService {
  static Stream<Map<String, dynamic>> streamSegments() async* {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.segmentsStream}');
      final token = await StorageService.getToken();

      developer.log('🔵 Stream Segments Request', name: 'SegmentService');
      developer.log('URL: $url', name: 'SegmentService');

      final request = http.Request('GET', url)
        ..headers.addAll(ApiConfig.getHeaders(token: token))
        ..headers['Accept'] = 'text/event-stream';

      final response = await request.send();

      if (response.statusCode == 200) {
        yield* parseSseEvents(response.stream);
      } else {
        final errorBody = await response.stream.bytesToString();
        developer.log(
          '❌ Stream Segments Failed: $errorBody',
          name: 'SegmentService',
        );
      }
    } catch (e) {
      developer.log('❌ Stream Segments Error: $e', name: 'SegmentService');
    }
  }

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
