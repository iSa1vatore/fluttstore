import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

class Button extends StatelessWidget {
  final bool _isPrimary;
  final bool _isLink;
  final bool rounded;
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const Button({
    required this.child,
    this.rounded = false,
    this.backgroundColor,
    this.onPressed,
    Key? key,
  })  : _isPrimary = false,
        _isLink = false,
        super(key: key);

  const Button.link({
    required this.child,
    this.rounded = false,
    this.backgroundColor,
    this.onPressed,
    Key? key,
  })  : _isPrimary = false,
        _isLink = true,
        super(key: key);

  const Button.primary({
    required this.child,
    this.rounded = false,
    this.backgroundColor,
    this.onPressed,
    Key? key,
  })  : _isPrimary = true,
        _isLink = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rounded ? 50 : 10),
          color: backgroundColor ??
              (_isLink
                  ? Colors.transparent
                  : _isPrimary
                      ? AppColors.accent
                      : AppColors.accent2),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 37,
            minWidth: 37,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
