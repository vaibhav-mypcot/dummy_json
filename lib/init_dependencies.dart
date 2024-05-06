import 'package:dio/dio.dart';
import 'package:dummy_json/feature/address/data/repository/profile_repository.dart';
import 'package:dummy_json/feature/address/data/services/profile_service.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/common_cubit/network/cubit/internet_cubit.dart';
import 'package:dummy_json/feature/home_collection/data/repositories/home_repository.dart';
import 'package:dummy_json/feature/home_collection/data/services/home_services.dart';
import 'package:dummy_json/feature/home_collection/presentation/bloc/home_bloc.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:dummy_json/feature/onboarding/data/repository/startup_repository.dart';
import 'package:dummy_json/feature/onboarding/data/services/startup_services.dart';
import 'package:dummy_json/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dummy_json/feature/products/data/repository/product_repository.dart';
import 'package:dummy_json/feature/products/data/services/product_service.dart';
import 'package:dummy_json/feature/products/presentation/bloc/product_bloc.dart';
import 'package:dummy_json/feature/suggest_question/data/repository/suggest_question_repository.dart';
import 'package:dummy_json/feature/suggest_question/data/services/suggest_question_service.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_bloc.dart';
import 'package:dummy_json/feature/users/data/repository/user_repository.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/users/data/services/user_services.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => Dio());
  _initProduct();
  _initProfile();
  _initSuggestQuestions();
  _initUsers();
  _initOnboarding();
  _initHome();

  serviceLocator.registerLazySingleton(() => NetworkBloc());
  serviceLocator.registerLazySingleton(() => InternetCubit());
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
    ..registerLazySingleton<ProfileServices>(
        () => ProfileServices(serviceLocator()))

    // Repository
    ..registerFactory<ProfileRepository>(() => ProfileRepository(
          serviceLocator(),
        ))

    // Bloc
    ..registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(
        profileRepository: serviceLocator(),
      ),
    );
}

/// -- Suggest Question
void _initSuggestQuestions() {
  serviceLocator
    ..registerLazySingleton<SuggestQuestionService>(
        () => SuggestQuestionService(serviceLocator()))
    ..registerFactory<SuggestQuestionRepository>(
        () => SuggestQuestionRepository(
              serviceLocator(),
            ))

    // Bloc
    ..registerFactory<SuggestQuestionBloc>(() => SuggestQuestionBloc(
          suggestQuestionRepository: serviceLocator(),
        ));
}

/// -- User data screen
void _initUsers() {
  serviceLocator

    // services
    ..registerLazySingleton<UserServices>(() => UserServices(serviceLocator()))

    // repo
    ..registerFactory<UserRepository>(() => UserRepository(serviceLocator()))

    // Bloc
    ..registerLazySingleton<UserBloc>(
        () => UserBloc(userRepository: serviceLocator()));
}

// /// -- onboarding
void _initOnboarding() {
  serviceLocator
    // services
    ..registerLazySingleton<StartupServices>(() => StartupServices())

    // repo
    ..registerFactory<OnBoardingRepository>(
        () => OnBoardingRepository(serviceLocator()))
    // Bloc
    ..registerLazySingleton<OnBoardingBloc>(
        () => OnBoardingBloc(onBoardingRepository: serviceLocator()));
}

//-- HomeCollections
void _initHome() {
  serviceLocator
    //services
    ..registerLazySingleton<HomeServices>(() => HomeServices())

    // repo
    ..registerFactory<HomeRepository>(() => HomeRepository(serviceLocator()))

    //bloc
    ..registerLazySingleton<HomeBloc>(
        () => HomeBloc(homeRepository: serviceLocator()));
}
