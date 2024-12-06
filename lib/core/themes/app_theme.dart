import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/core/themes/app_colors.dart';
import 'package:plant/core/themes/color_helper.dart';

class PlantThemeData {
  static ThemeData primary() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundPlus,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ColorHelper.setMaterialColor(
          AppColors.primary,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          color: AppColors.dark,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.regularGray,
        ),
        selectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.dark,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.regularGray,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.dark,
        unselectedItemColor: AppColors.regularGray,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.workSans(
          fontSize: 44,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
        ),
        headlineSmall: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.dark,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.dark,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.dark,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.dark,
        ),
        labelMedium: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.dark,
        ),
        labelSmall: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.dark,
        ),
      ),
    );
  }

  static ThemeData secondary() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundPlus,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.workSans(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        headlineSmall: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelMedium: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelSmall: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
      ),
    );
  }
}
