import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttstore/assets/res/res.dart';
import 'package:fluttstore/common/extensions/build_context.dart';
import 'package:fluttstore/common/ui_kit.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;

  const TopBar({
    this.title,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: ThemeData.estimateBrightnessForColor(
          context.theme.scaffoldBackgroundColor,
        ),
        statusBarIconBrightness: ThemeData.estimateBrightnessForColor(
          context.theme.scaffoldBackgroundColor,
        ),
      ),
      child: ColoredBox(
        color: context.theme.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            top: context.mediaQuery.viewPadding.top + 16,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (title != null)
                DefaultTextStyle(
                  style: context.textTheme.titleMedium!,
                  child: title!,
                ),
              SizedBox(
                height: 37,
                child: Row(
                  children: [
                    if (context.router.canPop())
                      Button(
                        child: Assets.icons.arrowLeft.svg(),
                        onPressed: () => context.router.pop(),
                      ),
                    const Spacer(),
                    if (actions != null) ...actions!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
