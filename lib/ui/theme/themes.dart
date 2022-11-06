import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black54),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black87,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black87,
    ),
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.white),
  );
}
