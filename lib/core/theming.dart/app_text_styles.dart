import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static TextTheme getTextTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? Colors.white : Colors.black;
   // final locale = Localizations.localeOf(context);

   // final isArabic = locale.languageCode == 'ar';
    //final font = isArabic ? AppFonts.cairo : AppFonts.poppins;
    final font =  AppFonts.poppins;

    return TextTheme(
      headlineLarge: font.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: font.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: font.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: font.copyWith(
        fontSize: 14,
        color: color.withValues(alpha: (0.85 * 255)),
      ),
      labelSmall: font.copyWith(
        fontSize: 12,
        color: color.withValues(alpha: (0.6 * 255)),
      ),
    );
  }
}
