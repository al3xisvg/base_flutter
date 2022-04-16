import 'package:flutter/material.dart';

import 'package:mb_base_dt/styles/colors.dart' as colors;

final ThemeData theme = ThemeData(
  primaryColor: colors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: colors.secondary),
  scaffoldBackgroundColor: colors.background,
  appBarTheme: const AppBarTheme(
    color: colors.background,
    iconTheme: IconThemeData(
      color: colors.accent,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: colors.primary,
    disabledColor: colors.disabled,
  ),
);
