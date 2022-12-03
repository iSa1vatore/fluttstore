import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

class CatalogCurrentAddress extends StatelessWidget {
  const CatalogCurrentAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.mapPoint.svg(),
          const SizedBox(width: 8),
          Text('Zihuatanejo, Gro', style: context.textTheme.labelMedium),
          const SizedBox(width: 8),
          Assets.icons.arrowDown.svg(),
        ],
      ),
    );
  }
}
