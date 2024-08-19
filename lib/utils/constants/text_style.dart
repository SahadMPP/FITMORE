import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final TextStyle heading1 = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle heading2 = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static final TextStyle heading3 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );

  static final TextStyle bodyText1 = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static final TextStyle bodyText2 = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static final TextStyle caption = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.black45,
  );

  static final TextStyle button = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle overline = GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.black45,
  );
}
