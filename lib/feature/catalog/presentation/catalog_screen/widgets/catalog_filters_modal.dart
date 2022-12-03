import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';

class CatalogFiltersModal extends StatelessWidget {
  const CatalogFiltersModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(.20),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: context.mediaQuery.viewPadding.bottom + 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onPressed: () => context.router.pop(),
                      child: Assets.icons.close.svg(),
                    ),
                    Button.primary(
                      onPressed: () => context.router.pop(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          context.l10n.done,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  context.l10n.filterOptions,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(context.l10n.brand, style: context.textTheme.titleMedium),
            const SizedBox(height: 6),
            AppDropdownButton(value: 'Samsung', onPressed: () {}),
            const SizedBox(height: 12),
            Text(context.l10n.price, style: context.textTheme.titleMedium),
            const SizedBox(height: 6),
            AppDropdownButton(value: r'$300 - $500', onPressed: () {}),
            const SizedBox(height: 12),
            Text(context.l10n.size, style: context.textTheme.titleMedium),
            const SizedBox(height: 6),
            AppDropdownButton(value: '4.5 to 5.5 inches', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
