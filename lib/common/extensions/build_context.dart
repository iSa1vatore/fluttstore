import 'package:flutter/material.dart';
import 'package:fluttstore/assets/localization/localization.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension LocalizationExtension on BuildContext {
  Localization get l10n => Localization.of(this);
}
