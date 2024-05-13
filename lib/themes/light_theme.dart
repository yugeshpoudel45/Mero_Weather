import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_weather/themes/text_theme.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  textTheme: myTextTheme,
  fontFamily: GoogleFonts.inter().fontFamily!,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    brightness: Brightness.light,
  ),
);
