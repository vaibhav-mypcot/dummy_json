import 'package:dummy_json/feature/address/data/repository/profile_repository.dart';
import 'package:dummy_json/feature/address/data/services/profile_service.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/products/data/repository/product_repository.dart';
import 'package:dummy_json/feature/products/data/services/product_service.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initProduct();
  _initProfile();
}

// --
void _initProduct() {
  serviceLocator

    // Services
    ..registerLazySingleton<ProductServices>(() => ProductServices())

    // Repository
    ..registerFactory<ProductRepository>(
      () => ProductRepository(
        serviceLocator(),
      ),
    )

    // Bloc
    ..registerLazySingleton<ProductBloc>(() => ProductBloc(
          productRepository: serviceLocator(),
        ));
}

/// -- Profile user
void _initProfile() {
  serviceLocator

    // Services
    ..registerLazySingleton<ProfileServices>(() => ProfileServices())

    // Repository
    ..registerFactory<ProfileRepository>(() => ProfileRepository(
          serviceLocator(),
        ))

    // Bloc
    ..registerLazySingleton<ProfileBloc>(() => ProfileBloc(
          profileRepository: serviceLocator(),
        ));
}
