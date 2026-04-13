import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://69dbd8a2560857310a081299.mockapi.io/1/'; // مثال
  final Dio _dio;

  ApiService(this._dio);

  /// get
  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await _dio.get(
      '$_baseUrl$url',
      queryParameters: query,
      options: Options(
        headers: {if (token != null) "Authorization": "Bearer $token"},
      ),
    );
  }

  /// post
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic>
    body, // البيانات اللي هنبعتها (Map أو FormData)
    String? token,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // لو محتاج تبعت توكن لليوزر
        },
      ),
    );
    return response.data;
  }
}
