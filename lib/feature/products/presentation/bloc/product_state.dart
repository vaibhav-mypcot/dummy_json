part of 'product_bloc.dart';

abstract class ProductState {}
final class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product>? product;
  ProductLoaded({required this.product});
}

class ProductLoading extends ProductState {
  final List<Product>? oldProduct;
  final bool isFetchFirst;
  ProductLoading(this.oldProduct, {this.isFetchFirst = false});
}

class ProductError extends ProductState {
  final String errorMessage;
  ProductError({required this.errorMessage});
}
