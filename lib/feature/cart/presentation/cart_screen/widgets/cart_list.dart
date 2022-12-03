import 'package:flutter/material.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/util/number_util.dart';

import '../bloc/cart_bloc.dart';
import 'cart_cell.dart';

class CartList extends StatelessWidget {
  final CartSuccessState cart;

  const CartList(this.cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.mediaQuery.viewPadding.bottom,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
              itemBuilder: (_, index) => CartCell(cart.items[index]),
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 8),
            child: Row(
              children: [
                Text(
                  context.l10n.total,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  r'$' '${numberFormatter.format(cart.total)} us',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 8),
            child: Row(
              children: [
                Text(
                  context.l10n.delivery,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  cart.delivery,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 22),
            child: SizedBox(
              height: 54,
              child: Button.primary(
                onPressed: () {},
                child: Text(
                  context.l10n.checkout,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
