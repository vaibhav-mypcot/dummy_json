import 'package:dummy_json/feature/products/data/product_model/product.dart';
import 'package:dummy_json/feature/products/data/services/product_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // final ProductRepository productRepository;
  int limit = 20;
  final ProductServices _productServices = ProductServices();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProductDataEvent>(_onFetchAllProductData);
  }
  void _onFetchAllProductData(
      FetchProductDataEvent event, Emitter<ProductState> emit) async {
    try {
      if (state is ProductLoading) return;

      final currentState = state;

      var oldProductData = <Product>[].cast<dynamic>();
      ;

      if (currentState is ProductLoaded) {
        oldProductData = currentState.product!;
      }

      emit(ProductLoading(oldProductData.cast<Product>(),
          isFetchFirst: limit == 20));

      await _productServices.getProductData(limit).then((newProduct) {
        limit += 20;
        final productData = (state as ProductLoading).oldProduct;
        productData!.addAll(newProduct.products!);
        emit(ProductLoaded(product: productData));
      });
    } catch (e) {
      print("${ProductError(errorMessage: 'Error fetching users: $e')}");
      emit(ProductError(errorMessage: 'Error fetching users: $e'));
    }
  }
}
