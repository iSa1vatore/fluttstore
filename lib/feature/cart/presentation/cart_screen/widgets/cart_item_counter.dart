import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';

class CartItemCounter extends StatelessWidget {
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final int count;

  const CartItemCounter({
    required this.onPlus,
    required this.onMinus,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.secondaryCard,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Button.link(
              onPressed: () {},
              child: Text(
                '-',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            count.toString(),
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: Button.link(
              onPressed: () {},
              child: Text(
                '+',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
