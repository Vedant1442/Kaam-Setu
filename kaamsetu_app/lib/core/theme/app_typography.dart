import 'package:flutter/material.dart';

class AppTypography {
  static const String headlineFont = 'Plus Jakarta Sans';
  static const String bodyFont = 'Inter';

  static const TextStyle headlineLg = TextStyle(
    fontFamily: headlineFont,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: bodyFont,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontFamily: headlineFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
