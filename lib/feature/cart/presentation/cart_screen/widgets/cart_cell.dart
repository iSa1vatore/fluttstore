import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/common/util/number_util.dart';
import 'package:fluttstore/feature/cart/domain/model/cart_item.dart';
import 'package:fluttstore/feature/cart/presentation/cart_screen/widgets/cart_item_counter.dart';

class CartCell extends StatelessWidget {
  final CartItem item;

  const CartCell(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: item.image,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 88,
            width: 88,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: context.textTheme.labelMedium?.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                r'$' + numberFormatter.format(item.price),
                style: context.textTheme.labelMedium?.copyWith(
                  fontSize: 20,
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        CartItemCounter(
          onPlus: () {},
          onMinus: () {},
          count: 1,
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 24,
          width: 24,
          child: Button.link(
            onPressed: () {},
            child: Assets.icons.trash.svg(),
          ),
        ),
      ],
    );
  }
}
