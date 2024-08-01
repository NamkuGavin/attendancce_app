import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeData {
  static TextStyle getTextTheme(Color color, double size, FontWeight weight) {
    return GoogleFonts.lato(color: color, fontSize: size, fontWeight: weight);
  }
}
