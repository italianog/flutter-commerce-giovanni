import 'package:flutter/material.dart';

class AppColors {
  static const backgroundGrey = Color(0xFFf8f4f4);
  static const primaryColor = Colors.orange;
}

class AppShadows {
  static BoxShadow defaultShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3), // changes position of shadow
  );
}
