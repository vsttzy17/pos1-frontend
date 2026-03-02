import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fe/core/network/dio_client.dart';

class AuthApi {
  static Future<bool> login(String username, String password) async {
    try {
      Response response = await DioClient.dio.post(
        "/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      String token = response.data["token"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      // print("TOKEN: ${prefs.getString("token")}");

      return true;
    } catch (e) {
      // print("LOGIN ERROR: $e");
      return false;
    }
  }
}