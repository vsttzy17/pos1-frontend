import 'package:fe/core/network/dio_client.dart';

class ProductApi {
  Future<List<dynamic>> getProducts() async {
    final response = await DioClient.dio.get('/products');
    return response.data;
  }
}