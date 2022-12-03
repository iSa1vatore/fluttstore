import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/colors.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/util/number_util.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

import '../../../domain/model/catalog_best_item.dart';

class CatalogPrimaryItem extends StatelessWidget {
  final CatalogBestItem item;
  final void Function(int id) onItemPressed;

  const CatalogPrimaryItem(
    this.item, {
    required this.onItemPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: () => onItemPressed(item.id),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(.10),
              blurRadius: 40,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: item.picture,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                      ),
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        r'$' + numberFormatter.format(item.discountPrice),
                        style: context.textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        r'$' +
                            numberFormatter.format(item.priceWithoutDiscount),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondary,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                          height: 2.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    item.title,
                    style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12,
              right: 12,
              child: SizedBox(
                height: 25,
                width: 25,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 20,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: item.isFavorites
                        ? Assets.icons.likeFilled.svg()
                        : Assets.icons.like.svg(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
