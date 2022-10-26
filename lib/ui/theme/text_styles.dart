import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle headingStyle = GoogleFonts.roboto(
    textStyle:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  );

  static TextStyle paragraphStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: Colors.black,
    ),
  );
}
