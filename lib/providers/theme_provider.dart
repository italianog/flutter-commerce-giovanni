import 'package:ecommerce/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppThemes.lightTheme);

  void selectTheme(ThemeData themeData) {
    state = themeData;
  }

  void selectDarkTheme(ThemeData darkTheme) {
    state = AppThemes.darkTheme;
  }

  void selectLightTheme(ThemeData lightTheme) {
    state = AppThemes.lightTheme;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
