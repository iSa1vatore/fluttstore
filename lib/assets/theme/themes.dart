import 'package:flutter/material.dart';
import 'package:fluttstore/assets/theme/theme.dart';
import 'package:fluttstore/assets/theme/typography.dart';
import 'package:fluttstore/common/extensions/color.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light {
    final theme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: AppColors.accent.toMaterialColor(),
      textTheme: appTypography.copyWith(
        labelSmall: appTypography.labelSmall?.copyWith(
          color: AppColors.secondary,
        ),
      ),
    );

    return theme.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: theme.textTheme.apply(
        bodyColor: AppColors.accent2,
        displayColor: AppColors.accent2,
      ),
      primaryTextTheme: theme.primaryTextTheme.apply(
        bodyColor: AppColors.accent2,
        displayColor: AppColors.accent2,
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: appTypography.labelLarge,
        unselectedLabelStyle: appTypography.labelLarge?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(.25),
        thickness: .7,
      ),
    );
  }
}
