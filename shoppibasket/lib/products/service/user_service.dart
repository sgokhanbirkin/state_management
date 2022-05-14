import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shoppibasket/features/products/product_model.dart';

class UserService {
  Dio dio;
  UserService() : dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get('/products');
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as List;
      return responseBody.map((e) => Product.fromJson(e)).toList();
    }
    throw Exception();
  }

  Future<bool> addProduct(Product product) async {
    try {
      final response = await dio.post(
        '/product',
        data: product.toJson(),
        options: Options(
          headers: {"user-id": "627cca621287137a51e216af"},
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      print('__________________');
      print(e);
      print('__________________');
    }
    return false;
  }
}
