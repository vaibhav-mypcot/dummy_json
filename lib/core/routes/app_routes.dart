import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeScreenRoute.page, path: '/'),
        AutoRoute(page: ProductListScreenRoute.page),
        AutoRoute(page: AddressScreenRoute.page),
        AutoRoute(page: EditAddressScreenRoute.page),
      ];
}
