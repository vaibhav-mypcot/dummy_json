// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:dummy_json/feature/address/presentation/page/address_screen.dart'
    as _i1;
import 'package:dummy_json/feature/address/presentation/page/edit_address_screen.dart'
    as _i2;
import 'package:dummy_json/feature/home/presentation/home_screen.dart' as _i3;
import 'package:dummy_json/feature/home/presentation/language_screen.dart'
    as _i4;
import 'package:dummy_json/feature/products/presentation/page/product_list_screen.dart'
    as _i5;
import 'package:dummy_json/feature/suggest_question/prsentation/page/suggest_question_screen.dart'
    as _i6;
import 'package:dummy_json/feature/users/presentation/page/user_data_screen.dart'
    as _i7;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddressScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddressScreen(),
      );
    },
    EditAddressScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditAddressScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LanguageScreen(),
      );
    },
    ProductListScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProductListScreen(),
      );
    },
    SuggestQuestionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SuggestQuestionScreenRouteArgs>(
          orElse: () => const SuggestQuestionScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SuggestQuestionScreen(key: args.key),
      );
    },
    UserDataRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UserData(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressScreen]
class AddressScreenRoute extends _i8.PageRouteInfo<void> {
  const AddressScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditAddressScreen]
class EditAddressScreenRoute extends _i8.PageRouteInfo<void> {
  const EditAddressScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EditAddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditAddressScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i8.PageInfo<HomeScreenRouteArgs> page =
      _i8.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LanguageScreen]
class LanguageScreenRoute extends _i8.PageRouteInfo<void> {
  const LanguageScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductListScreen]
class ProductListScreenRoute extends _i8.PageRouteInfo<void> {
  const ProductListScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProductListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SuggestQuestionScreen]
class SuggestQuestionScreenRoute
    extends _i8.PageRouteInfo<SuggestQuestionScreenRouteArgs> {
  SuggestQuestionScreenRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SuggestQuestionScreenRoute.name,
          args: SuggestQuestionScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SuggestQuestionScreenRoute';

  static const _i8.PageInfo<SuggestQuestionScreenRouteArgs> page =
      _i8.PageInfo<SuggestQuestionScreenRouteArgs>(name);
}

class SuggestQuestionScreenRouteArgs {
  const SuggestQuestionScreenRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'SuggestQuestionScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.UserData]
class UserDataRoute extends _i8.PageRouteInfo<void> {
  const UserDataRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDataRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
