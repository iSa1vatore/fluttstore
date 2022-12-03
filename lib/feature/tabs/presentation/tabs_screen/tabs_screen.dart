import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/widgets/bottom_bar.dart';
import 'package:fluttstore/feature/cart/di/cart_scope.dart';
import 'package:fluttstore/feature/cart/presentation/cart_screen/bloc/cart_bloc.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CatalogRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              child,
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BlocBuilder<CartBloc, CartState>(
                  bloc: context.cartScope.cartBloc,
                  builder: (_, state) => BottomBar(
                    [
                      BottomBarItem(
                        title: context.l10n.explorer,
                        icon: Assets.icons.close,
                      ),
                      BottomBarItem(
                        title: context.l10n.cart,
                        icon: Assets.icons.cart,
                        badge: state.maybeMap(
                          orElse: () => 0,
                          success: (state) => state.items.length,
                        ),
                      ),
                      BottomBarItem(
                        title: context.l10n.favorites,
                        icon: Assets.icons.like,
                      ),
                      BottomBarItem(
                        title: context.l10n.profile,
                        icon: Assets.icons.user,
                      ),
                    ],
                    currentTabIndex: tabsRouter.activeIndex,
                    onTabChange: (index) {
                      if (index == 1) context.router.push(const CartRoute());
                      //tabsRouter.setActiveIndex(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
