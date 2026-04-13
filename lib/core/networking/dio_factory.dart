import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; // اختيارية لمراقبة الطلبات في الـ Console

class DioFactory {
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: "https://your-mock-api.com/", // رابط الـ Mock API بتاعك
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
        ),
      );

      // إضافة الـ Logger عشان نشوف الداتا اللي رايحة وجاية وأحنا بنبرمج
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          request: true,
        ),
      );
    }
    return _dio!;
  }
}
