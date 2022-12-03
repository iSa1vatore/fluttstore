import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/colors.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

class AppDropdownButton extends StatelessWidget {
  final String value;
  final VoidCallback? onPressed;

  const AppDropdownButton({
    required this.value,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(value, style: context.textTheme.bodyLarge),
              const Spacer(),
              Assets.icons.arrowDown.svg(
                width: 11,
                height: 11,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
