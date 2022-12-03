import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';

class CatalogCategoryItem extends StatelessWidget {
  final String label;
  final SvgGenImage icon;
  final bool isSelected;
  final void Function() onPressed;

  const CatalogCategoryItem({
    required this.isSelected,
    required this.label,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SizedBox(
              height: 71,
              width: 71,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? context.theme.colorScheme.primary
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(.16),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                  child: icon.svg(
                    color: isSelected ? Colors.white : AppColors.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(label, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
