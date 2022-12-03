import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/extensions/list.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

class CapacitySelector extends StatelessWidget {
  final List<String> values;
  final int selectedIndex;
  final void Function(int) onChanged;

  const CapacitySelector({
    required this.values,
    required this.selectedIndex,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        values.length,
        (i) => TapEffect(
          onTap: () => onChanged(i),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: i == selectedIndex
                  ? context.theme.colorScheme.primary
                  : Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                '${values[i]} GB',
                style: context.textTheme.titleSmall?.copyWith(
                  color:
                      i == selectedIndex ? Colors.white : AppColors.secondary,
                ),
              ),
            ),
          ),
        ),
      ).addSeparator(const SizedBox(width: 16)),
    );
  }
}
