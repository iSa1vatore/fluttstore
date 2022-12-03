import 'package:flutter/material.dart';
import 'package:fluttstore/assets/res/res.dart';

const TextStyle _defaultTextStyle = TextStyle(
  fontFamily: FontFamily.markPro,
);

final appTypography = const TextTheme().copyWith(
  titleMedium: _defaultTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 22 / 18,
  ),
  titleLarge: _defaultTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),
  titleSmall: _defaultTextStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 16 / 13,
  ),
  labelLarge: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    height: 25 / 20,
    fontSize: 20,
  ),
  labelSmall: _defaultTextStyle.copyWith(
    height: 14 / 11,
    fontSize: 11,
    letterSpacing: 1,
  ),
  labelMedium: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    height: 20 / 16,
    fontSize: 16,
  ),
  bodySmall: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    height: 19 / 15,
    fontSize: 15,
  ),
  bodyMedium: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    height: 15 / 12,
    fontSize: 12,
  ),
  bodyLarge: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 18,
  ),
  headlineMedium: _defaultTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 35,
    height: 44 / 35,
  ),
);
