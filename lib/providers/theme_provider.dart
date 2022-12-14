import 'package:ecommerce/ui/theme/app_colors.dart';
import 'package:ecommerce/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppThemes.lightTheme);

  /*      AppThemes.lightTheme.copyWith(
                    inputDecorationTheme: InputDecorationTheme(
              iconColor: AppColors.primaryColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              labelStyle: TextStyle(color: AppColors.primaryColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
            ),
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
            ),
          ),*/

  void selectTheme(ThemeData themeData) {
    state = themeData;
  }

  void selectDarkTheme() {
    state = AppThemes.darkTheme;
  }

  void selectLightTheme() {
    state = AppThemes.lightTheme;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
