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
