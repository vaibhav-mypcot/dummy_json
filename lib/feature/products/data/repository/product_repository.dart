import 'package:dummy_json/feature/products/data/product_model/product_model.dart';
import 'package:dummy_json/feature/products/data/services/product_service.dart';

class ProductRepository {
  final ProductServices productServices;
  ProductRepository(this.productServices);

  Future<ProductModel> fetchProductData(int limit) async {
    final products = await productServices.getProductData(limit);
    return products;
  }
}
