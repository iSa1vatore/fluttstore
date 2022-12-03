import 'dart:io';

import 'package:flutter/material.dart';

class TapEffect extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final double borderRadius;

  const TapEffect({
    required this.child,
    this.onTap,
    this.borderRadius = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) return _TapEffectIos(child: child, onTap: onTap);

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: child,
    );
  }
}

class _TapEffectIos extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;

  const _TapEffectIos({
    required this.child,
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<_TapEffectIos> createState() => _TapEffectIosState();
}

class _TapEffectIosState extends State<_TapEffectIos>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(Tween<double>(begin: 1.0, end: .5));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onTap != null ? _handleTapDown : null,
      onTapUp: widget.onTap != null ? _handleTapUp : null,
      onTapCancel: widget.onTap != null ? _handleTapCancel : null,
      onTap: widget.onTap,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final wasHeldDown = _buttonHeldDown;
    final ticker = _buttonHeldDown
        ? _animationController.animateTo(
            1.0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeInOutCubicEmphasized,
          )
        : _animationController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
          );

    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }
}
