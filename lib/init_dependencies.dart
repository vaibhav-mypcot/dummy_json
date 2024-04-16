// import 'package:dummy_json/feature/products/data/repository/product_repository.dart';
// import 'package:dummy_json/feature/products/data/services/product_service.dart';
// import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
// import 'package:get_it/get_it.dart';

// final serviceLocator = GetIt.instance;

// Future<void> initDependencies() async {
//   _initProduct();
// }

// // --
// void _initProduct() {
//   serviceLocator

//     // Services
//     ..registerLazySingleton<ProductServices>(() => ProductServices())

//     // Repository
//     ..registerFactory<ProductRepository>(
//       () => ProductRepository(
//         serviceLocator(),
//       ),
//     )
//     ..registerLazySingleton<ProductBloc>(() => ProductBloc(
//           productRepository: serviceLocator(),
//         ));
// }
