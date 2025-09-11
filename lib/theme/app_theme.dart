import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dark() {
    const surface = Color(0xFF0B0B0C);
    const container = Color(0xFF111214);
    const primary = Color(0xFFE11D48); // rose-600
    const onPrimary = Colors.white;

    final colorScheme = const ColorScheme.dark().copyWith(
      primary: primary,
      onPrimary: onPrimary,
      surface: surface,
      surfaceContainer: container,
      secondary: const Color(0xFF1F2937),
      error: const Color(0xFFEF4444),
    );

    final textTheme =
        GoogleFonts.interTextTheme(
          const TextTheme(
            displayLarge: TextStyle(fontWeight: FontWeight.w700),
            displayMedium: TextStyle(fontWeight: FontWeight.w700),
            displaySmall: TextStyle(fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(fontWeight: FontWeight.w700),
            headlineSmall: TextStyle(fontWeight: FontWeight.w700),
            titleLarge: TextStyle(fontWeight: FontWeight.w600),
            titleMedium: TextStyle(fontWeight: FontWeight.w600),
            titleSmall: TextStyle(fontWeight: FontWeight.w600),
            bodyLarge: TextStyle(fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(fontWeight: FontWeight.w500),
            bodySmall: TextStyle(fontWeight: FontWeight.w500),
            labelLarge: TextStyle(fontWeight: FontWeight.w600),
            labelMedium: TextStyle(fontWeight: FontWeight.w600),
          ),
        ).apply(
          bodyColor: const Color(0xFFEAEAEA),
          displayColor: const Color(0xFFEAEAEA),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surface,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: container,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(12),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: container,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: container,
        selectedColor: primary,
        labelStyle: const TextStyle(
          color: Color(0xFFEAEAEA),
          fontWeight: FontWeight.w600,
        ),
        shape: StadiumBorder(side: BorderSide.none),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
