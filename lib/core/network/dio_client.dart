import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      // baseUrl: "http://10.0.2.2:5000",
      // baseUrl: "http://192.168.1.26:5000",
      baseUrl: "http://localhost:5000",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}