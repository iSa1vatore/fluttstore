// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:fluttstore/feature/cart/presentation/cart_screen/cart_screen.dart'
    as _i3;
import 'package:fluttstore/feature/catalog/presentation/catalog_screen/catalog_screen.dart'
    as _i4;
import 'package:fluttstore/feature/product/presentation/product_screen/product_screen.dart'
    as _i2;
import 'package:fluttstore/feature/tabs/presentation/tabs_screen/tabs_screen.dart'
    as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    TabsRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabsScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i2.ProductScreen(
          id: args.id,
          key: args.key,
        )),
      );
    },
    CartRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartScreen(),
      );
    },
    CatalogRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.CatalogScreen(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          TabsRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              CatalogRoute.name,
              path: '',
              parent: TabsRoute.name,
            )
          ],
        ),
        _i5.RouteConfig(
          ProductRoute.name,
          path: '/product-screen',
        ),
        _i5.RouteConfig(
          CartRoute.name,
          path: '/cart-screen',
        ),
      ];
}

/// generated route for
/// [_i1.TabsScreen]
class TabsRoute extends _i5.PageRouteInfo<void> {
  const TabsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TabsRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsRoute';
}

/// generated route for
/// [_i2.ProductScreen]
class ProductRoute extends _i5.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    required int id,
    _i6.Key? key,
  }) : super(
          ProductRoute.name,
          path: '/product-screen',
          args: ProductRouteArgs(
            id: id,
            key: key,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ProductRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i3.CartScreen]
class CartRoute extends _i5.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-screen',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i4.CatalogScreen]
class CatalogRoute extends _i5.PageRouteInfo<void> {
  const CatalogRoute()
      : super(
          CatalogRoute.name,
          path: '',
        );

  static const String name = 'CatalogRoute';
}
