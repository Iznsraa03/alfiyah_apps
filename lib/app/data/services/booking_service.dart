import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:alfiyah_apps/app/data/services/api_config.dart';
import 'package:alfiyah_apps/app/data/services/storage_service.dart';
import 'package:alfiyah_apps/app/data/services/stream_service.dart';

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

  static Stream<Map<String, dynamic>> streamBookings() async* {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.bookingsStream}');
      final token = await StorageService.getToken();

      developer.log('🔵 Stream Bookings Request', name: 'BookingService');
      developer.log('URL: $url', name: 'BookingService');

      final request = http.Request('GET', url)
        ..headers.addAll(ApiConfig.getHeaders(token: token))
        ..headers['Accept'] = 'text/event-stream';

      final response = await request.send();

      if (response.statusCode == 200) {
        yield* parseSseEvents(response.stream);
      } else {
        final errorBody = await response.stream.bytesToString();
        developer.log(
          '❌ Stream Bookings Failed: $errorBody',
          name: 'BookingService',
        );
      }
    } catch (e) {
      developer.log('❌ Stream Bookings Error: $e', name: 'BookingService');
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
