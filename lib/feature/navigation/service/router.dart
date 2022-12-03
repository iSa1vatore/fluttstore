import 'package:auto_route/auto_route.dart';
import 'package:fluttstore/feature/cart/presentation/cart_screen/cart_screen.dart';
import 'package:fluttstore/feature/catalog/presentation/catalog_screen/catalog_screen.dart';
import 'package:fluttstore/feature/product/presentation/product_screen/product_screen.dart';
import 'package:fluttstore/feature/tabs/presentation/tabs_screen/tabs_screen.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: TabsScreen,
      children: [
        AutoRoute(
          initial: true,
          page: CatalogScreen,
        ),
      ],
    ),
    AutoRoute(page: ProductScreen),
    AutoRoute(page: CartScreen),
  ],
)
class $AppRouter {}
