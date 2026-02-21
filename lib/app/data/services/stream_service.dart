import 'dart:convert';

Stream<Map<String, dynamic>> parseSseEvents(Stream<List<int>> byteStream) {
  return byteStream
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .where((line) => line.startsWith('data:'))
      .map((line) => line.substring(5).trim())
      .where((payload) => payload.isNotEmpty)
      .map((payload) {
    final decoded = json.decode(payload);
    if (decoded is Map<String, dynamic>) {
      final data = decoded['data'];
      if (data is String && data.isNotEmpty) {
        try {
          decoded['data'] = json.decode(data);
        } catch (_) {
          decoded['data'] = data;
        }
      }
      return decoded;
    }
    return <String, dynamic>{'data': decoded};
  });
}
