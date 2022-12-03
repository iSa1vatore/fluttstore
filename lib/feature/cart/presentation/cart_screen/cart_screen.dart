import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/widgets/error_block.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';
import 'package:fluttstore/feature/cart/di/cart_scope.dart';
import 'package:fluttstore/feature/cart/presentation/cart_screen/bloc/cart_bloc.dart';
import 'package:fluttstore/feature/cart/presentation/cart_screen/widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        actions: [
          TapEffect(
            onTap: () {},
            child: Row(
              children: [
                Text('Add address', style: context.textTheme.labelMedium),
                const SizedBox(width: 8),
                Button.primary(
                  child: Assets.icons.mapPoint.svg(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
            child: Text(
              context.l10n.myCart,
              style: context.textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.accent2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: BlocBuilder<CartBloc, CartState>(
                bloc: context.cartScope.cartBloc,
                builder: (_, state) => state.map(
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (_) => ErrorBlock(
                    desc: context.l10n.errorLoadingCart,
                    onTryAgain: () => context.cartScope.cartBloc.add(
                      const CartEvent.init(),
                    ),
                    inverseColorScheme: true,
                  ),
                  success: CartList.new,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
