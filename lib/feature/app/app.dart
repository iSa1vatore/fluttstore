import 'package:flutter/material.dart';
import 'package:fluttstore/assets/localization/localization.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/feature/app/di/app_scope.dart';
import 'package:fluttstore/feature/cart/di/cart_scope.dart';
import 'package:fluttstore/feature/catalog/di/catalog_scope.dart';
import 'package:fluttstore/feature/product/di/product_scope.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Localization
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Localization.delegate.supportedLocales,
      // Debug
      debugShowCheckedModeBanner: false,
      // Theme
      theme: AppThemes.light,
      // Router
      routerDelegate: context.appScope.router.delegate(),
      routeInformationParser: context.appScope.router.defaultRouteParser(),
    );
  }

  static void run() {
    runApp(
      MultiProvider(
        providers: [
          Provider<AppScope>(create: (_) => AppScopeImpl()),
          Provider<CatalogScope>(
            create: (context) => CatalogScopeImpl(dio: context.appScope.dio),
          ),
          Provider<ProductScope>(
            create: (context) => ProductScopeImpl(dio: context.appScope.dio),
          ),
          Provider<CartScope>(
            create: (context) => CartScopeImpl(dio: context.appScope.dio),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
