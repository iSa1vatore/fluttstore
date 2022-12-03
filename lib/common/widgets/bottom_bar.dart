import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/assets/theme/colors.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/widgets/tap_effect.dart';

const bottomBarHeight = 56.0;

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentTabIndex;

  final Function(int) onTabChange;

  const BottomBar(
    this.items, {
    required this.currentTabIndex,
    required this.onTabChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.accent2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 36,
          right: 36,
          bottom: context.mediaQuery.viewPadding.bottom,
        ),
        child: SizedBox(
          height: bottomBarHeight,
          child: Row(
            children: List.generate(
              items.length,
              (i) => Expanded(
                child: _BottomBarItem(
                  items[i],
                  isSelected: currentTabIndex == i,
                  onPressed: () => onTabChange(i),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final BottomBarItem item;
  final bool isSelected;
  final void Function() onPressed;

  const _BottomBarItem(
    this.item, {
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: TapEffect(
        onTap: onPressed,
        child: Center(
          child: isSelected
              ? Row(
                  children: [
                    const SizedBox(
                      height: 8,
                      width: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.title,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              : Stack(
                  clipBehavior: Clip.none,
                  children: [
                    item.icon.svg(
                      width: 18,
                      height: 18,
                      color: Colors.white,
                    ),
                    if (item.badge != null && item.badge! > 0)
                      Positioned(
                        top: -6,
                        right: -12,
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                item.badge.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class BottomBarItem {
  final String title;
  final SvgGenImage icon;
  final int? badge;

  const BottomBarItem({
    required this.title,
    required this.icon,
    this.badge,
  });
}
