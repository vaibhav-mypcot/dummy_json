import 'dart:convert';

import 'package:dummy_json/feature/products/data/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  final String yellow = '\x1B[33m';
  Future<ProductModel> getProductData(int fetchLimit) async {
    try {
      final response = await http.get(
          Uri.parse('https://dummyjson.com/products?skip=0&limit=$fetchLimit'));
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        final Map<String, dynamic> responseData = jsonDecode(responseBody);
        print('${yellow} : $responseData');
        return ProductModel.fromMap(responseData);
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
