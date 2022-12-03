import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';

import '../../../domain/model/catalog_hot_item.dart';

class HotSaleItem extends StatelessWidget {
  final CatalogHotItem item;
  final void Function(int id) onItemPressed;

  const HotSaleItem(
    this.item, {
    required this.onItemPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: item.picture,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          if (item.isNew)
            Positioned(
              left: 16,
              top: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    context.l10n.itemNew,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 24,
            top: 0,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  item.title,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.subtitle,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                if (item.isBuy) ...[
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 30,
                    child: Button(
                      onPressed: () => onItemPressed(item.id),
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(context.l10n.buyNow),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
