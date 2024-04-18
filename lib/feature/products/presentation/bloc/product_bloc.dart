import 'package:dummy_json/feature/products/data/product_model/product.dart';
import 'package:dummy_json/feature/products/data/repository/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // final ProductRepository productRepository;
  int limit = 20;
  // final ProductServices _productServices = ProductServices();
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<FetchProductDataEvent>(_onFetchAllProductData);
  }
  void _onFetchAllProductData(
      FetchProductDataEvent event, Emitter<ProductState> emit) async {
    try {
      if (state is ProductLoading) return;

      final currentState = state;

      var oldProductData = <Product>[].cast<dynamic>();

      if (currentState is ProductLoaded) {
        oldProductData = currentState.product!;
      }

      emit(ProductLoading(oldProductData.cast<Product>(),
          isFetchFirst: limit == 20));

      await productRepository.fetchProductData(limit).then((newProduct) {
        limit += 20;
        var productData = (state as ProductLoading).oldProduct;
        productData!.addAll(newProduct.products!);
        emit(ProductLoaded(product: productData));
      });
    } catch (e) {
      emit(ProductError(errorMessage: 'Error fetching users: $e'));
    }
  }

  @override
  Future<void> close() {
    // Dispose of resources here if needed
    // For example, close any streams or sinks
    // productRepository.dispose();
    return super.close();
  }
}
