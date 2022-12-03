import 'package:flutter/material.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';

class CatalogHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const CatalogHeader({
    required this.title,
    this.actionLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textTheme.labelLarge,
          ),
        ),
        if (actionLabel != null)
          Button.link(
            onPressed: () {},
            child: Text(
              actionLabel!,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 15,
                color: context.theme.colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}
