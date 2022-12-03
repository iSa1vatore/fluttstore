import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/list.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final void Function(int) onChanged;

  const ColorSelector({
    required this.colors,
    required this.selectedIndex,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        colors.length,
        (i) => TapEffect(
          onTap: () => onChanged(i),
          child: SizedBox(
            width: 40,
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[i],
              ),
              child: i == selectedIndex
                  ? Center(child: Assets.icons.check.svg())
                  : const SizedBox(),
            ),
          ),
        ),
      ).addSeparator(const SizedBox(width: 16)),
    );
  }
}
