import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF49672F);
  static const primaryContainerColor = Color(0xFF81A263);
  static const surfaceColor = Color(0xFFFEFAE7);
  static const onSurfaceColor = Color(0xFF1D1C11);
  static const tertiaryColor = Color(0xFF9A4341);
  static const errorColor = Color(0xFFBA1A1A);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: Colors.white,
        primaryContainer: primaryContainerColor,
        onPrimaryContainer: const Color(0xFF1C3704),
        surface: surfaceColor,
        onSurface: onSurfaceColor,
        tertiary: tertiaryColor,
        error: errorColor,
      ),
      textTheme: GoogleFonts.beVietnamProTextTheme().copyWith(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
        ),
        bodyLarge: GoogleFonts.beVietnamPro(
          fontSize: 16,
          color: onSurfaceColor,
        ),
        bodyMedium: GoogleFonts.beVietnamPro(
          fontSize: 14,
          color: onSurfaceColor,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
      scaffoldBackgroundColor: surfaceColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
