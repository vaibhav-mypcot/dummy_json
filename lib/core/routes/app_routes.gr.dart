// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:dummy_json/feature/address/presentation/page/address_screen.dart'
    as _i1;
import 'package:dummy_json/feature/address/presentation/page/edit_address_screen.dart'
    as _i2;
import 'package:dummy_json/feature/home/presentation/home_screen.dart' as _i4;
import 'package:dummy_json/feature/home/presentation/language_screen.dart'
    as _i5;
import 'package:dummy_json/feature/home_collection/presentation/pages/home_page.dart'
    as _i3;
import 'package:dummy_json/feature/onboarding/presentation/pages/onboarding_screen.dart'
    as _i6;
import 'package:dummy_json/feature/products/presentation/page/product_list_screen.dart'
    as _i7;
import 'package:dummy_json/feature/splash/prsentation/pages/splash_screen.dart'
    as _i8;
import 'package:dummy_json/feature/suggest_question/prsentation/page/suggest_question_screen.dart'
    as _i9;
import 'package:dummy_json/feature/users/presentation/page/user_data_screen.dart'
    as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddressScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddressScreen(),
      );
    },
    EditAddressScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditAddressScreen(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeScreen(key: args.key),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LanguageScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingScreenRouteArgs>(
          orElse: () => const OnBoardingScreenRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OnBoardingScreen(key: args.key),
      );
    },
    ProductListScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProductListScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    SuggestQuestionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SuggestQuestionScreenRouteArgs>(
          orElse: () => const SuggestQuestionScreenRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SuggestQuestionScreen(key: args.key),
      );
    },
    UserDataRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.UserData(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressScreen]
class AddressScreenRoute extends _i11.PageRouteInfo<void> {
  const AddressScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditAddressScreen]
class EditAddressScreenRoute extends _i11.PageRouteInfo<void> {
  const EditAddressScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EditAddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditAddressScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i11.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i11.PageInfo<HomePageRouteArgs> page =
      _i11.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i11.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i11.PageInfo<HomeScreenRouteArgs> page =
      _i11.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LanguageScreen]
class LanguageScreenRoute extends _i11.PageRouteInfo<void> {
  const LanguageScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoardingScreen]
class OnBoardingScreenRoute
    extends _i11.PageRouteInfo<OnBoardingScreenRouteArgs> {
  OnBoardingScreenRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OnBoardingScreenRoute.name,
          args: OnBoardingScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnBoardingScreenRoute';

  static const _i11.PageInfo<OnBoardingScreenRouteArgs> page =
      _i11.PageInfo<OnBoardingScreenRouteArgs>(name);
}

class OnBoardingScreenRouteArgs {
  const OnBoardingScreenRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'OnBoardingScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProductListScreen]
class ProductListScreenRoute extends _i11.PageRouteInfo<void> {
  const ProductListScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProductListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreenRoute extends _i11.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SuggestQuestionScreen]
class SuggestQuestionScreenRoute
    extends _i11.PageRouteInfo<SuggestQuestionScreenRouteArgs> {
  SuggestQuestionScreenRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SuggestQuestionScreenRoute.name,
          args: SuggestQuestionScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SuggestQuestionScreenRoute';

  static const _i11.PageInfo<SuggestQuestionScreenRouteArgs> page =
      _i11.PageInfo<SuggestQuestionScreenRouteArgs>(name);
}

class SuggestQuestionScreenRouteArgs {
  const SuggestQuestionScreenRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SuggestQuestionScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.UserData]
class UserDataRoute extends _i11.PageRouteInfo<void> {
  const UserDataRoute({List<_i11.PageRouteInfo>? children})
      : super(
          UserDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDataRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
