import 'package:dio/dio.dart';
import 'package:ecommerce/models/product.dart';

class Apis {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    final Response response =
        await _dio.get('https://fakestoreapi.com/products');
    products = response.data
        .map<Product>(
          (element) => Product.fromMap(element),
        )
        .toList();
    return products;
  }
}
