// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:dummy_json/feature/address/presentation/page/address_screen.dart'
    as _i1;
import 'package:dummy_json/feature/address/presentation/page/edit_address_screen.dart'
    as _i4;
import 'package:dummy_json/feature/auth/presentation/pages/auth_screen.dart'
    as _i2;
import 'package:dummy_json/feature/drawer_menu/presentation/pages/drawer_menu_screen.dart'
    as _i3;
import 'package:dummy_json/feature/home/presentation/home_screen.dart' as _i6;
import 'package:dummy_json/feature/home/presentation/language_screen.dart'
    as _i7;
import 'package:dummy_json/feature/home_collection/presentation/pages/home_page.dart'
    as _i5;
import 'package:dummy_json/feature/onboarding/presentation/pages/onboarding_screen.dart'
    as _i8;
import 'package:dummy_json/feature/otp/presentation/pages/otp_screen.dart'
    as _i9;
import 'package:dummy_json/feature/products/presentation/page/product_list_screen.dart'
    as _i11;
import 'package:dummy_json/feature/profile/presentation/pages/sub_profile_screen.dart'
    as _i13;
import 'package:dummy_json/feature/splash/prsentation/pages/splash_screen.dart'
    as _i12;
import 'package:dummy_json/feature/suggest_question/prsentation/page/suggest_question_screen.dart'
    as _i14;
import 'package:dummy_json/feature/terms_policy/presentation/page/policy_page.dart'
    as _i10;
import 'package:dummy_json/feature/users/presentation/page/user_data_screen.dart'
    as _i15;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AddressScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddressScreen(),
      );
    },
    AuthScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthScreenRouteArgs>(
          orElse: () => const AuthScreenRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthScreen(key: args.key),
      );
    },
    DrawerMenuScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DrawerMenuScreen(),
      );
    },
    EditAddressScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EditAddressScreen(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomePage(key: args.key),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeScreen(key: args.key),
      );
    },
    LanguageScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LanguageScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardingScreen(),
      );
    },
    OtpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtpScreenRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OtpScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    PolicyPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PolicyPage(),
      );
    },
    ProductListScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProductListScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
    SubProfileScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SubProfileScreen(),
      );
    },
    SuggestQuestionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SuggestQuestionScreenRouteArgs>(
          orElse: () => const SuggestQuestionScreenRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.SuggestQuestionScreen(key: args.key),
      );
    },
    UserDataRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.UserData(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressScreen]
class AddressScreenRoute extends _i16.PageRouteInfo<void> {
  const AddressScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreenRoute extends _i16.PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AuthScreenRoute.name,
          args: AuthScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthScreenRoute';

  static const _i16.PageInfo<AuthScreenRouteArgs> page =
      _i16.PageInfo<AuthScreenRouteArgs>(name);
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DrawerMenuScreen]
class DrawerMenuScreenRoute extends _i16.PageRouteInfo<void> {
  const DrawerMenuScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DrawerMenuScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrawerMenuScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EditAddressScreen]
class EditAddressScreenRoute extends _i16.PageRouteInfo<void> {
  const EditAddressScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EditAddressScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditAddressScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomePageRoute extends _i16.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i16.PageInfo<HomePageRouteArgs> page =
      _i16.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i16.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i16.PageInfo<HomeScreenRouteArgs> page =
      _i16.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.LanguageScreen]
class LanguageScreenRoute extends _i16.PageRouteInfo<void> {
  const LanguageScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LanguageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoardingScreen]
class OnBoardingScreenRoute extends _i16.PageRouteInfo<void> {
  const OnBoardingScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OnBoardingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OtpScreen]
class OtpScreenRoute extends _i16.PageRouteInfo<OtpScreenRouteArgs> {
  OtpScreenRoute({
    _i17.Key? key,
    required String phoneNumber,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          OtpScreenRoute.name,
          args: OtpScreenRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpScreenRoute';

  static const _i16.PageInfo<OtpScreenRouteArgs> page =
      _i16.PageInfo<OtpScreenRouteArgs>(name);
}

class OtpScreenRouteArgs {
  const OtpScreenRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i17.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpScreenRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i10.PolicyPage]
class PolicyPageRoute extends _i16.PageRouteInfo<void> {
  const PolicyPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PolicyPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolicyPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductListScreen]
class ProductListScreenRoute extends _i16.PageRouteInfo<void> {
  const ProductListScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProductListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashScreen]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SubProfileScreen]
class SubProfileScreenRoute extends _i16.PageRouteInfo<void> {
  const SubProfileScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SubProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubProfileScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SuggestQuestionScreen]
class SuggestQuestionScreenRoute
    extends _i16.PageRouteInfo<SuggestQuestionScreenRouteArgs> {
  SuggestQuestionScreenRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SuggestQuestionScreenRoute.name,
          args: SuggestQuestionScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SuggestQuestionScreenRoute';

  static const _i16.PageInfo<SuggestQuestionScreenRouteArgs> page =
      _i16.PageInfo<SuggestQuestionScreenRouteArgs>(name);
}

class SuggestQuestionScreenRouteArgs {
  const SuggestQuestionScreenRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SuggestQuestionScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.UserData]
class UserDataRoute extends _i16.PageRouteInfo<void> {
  const UserDataRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UserDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDataRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
