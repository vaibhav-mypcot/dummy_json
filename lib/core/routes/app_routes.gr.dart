// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dummy_json/feature/address/presentation/page/address_screen.dart'
    as _i1;
import 'package:dummy_json/feature/address/presentation/page/edit_address_screen.dart'
    as _i2;
import 'package:dummy_json/feature/home/presentation/home_screen.dart' as _i3;
import 'package:dummy_json/feature/products/presentation/page/product_list_screen.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddressScreenRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddressScreen(),
      );
    },
    EditAddressScreenRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditAddressScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    ProductListScreenRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProductListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressScreen]
class AddressScreenRoute extends _i5.PageRouteInfo<void> {
  const AddressScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressScreenRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditAddressScreen]
class EditAddressScreenRoute extends _i5.PageRouteInfo<void> {
  const EditAddressScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EditAddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditAddressScreenRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i5.PageInfo<HomeScreenRouteArgs> page =
      _i5.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProductListScreen]
class ProductListScreenRoute extends _i5.PageRouteInfo<void> {
  const ProductListScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProductListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListScreenRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
