import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_app/core/themes/app_colors.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.white,
  // splashColor: AppColors.transparent,
  // highlightColor: AppColors.transparent,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.purple,
    showSelectedLabels: true,
    selectedItemColor: AppColors.white,
    showUnselectedLabels: false,
    selectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.purple,
    ),
    unselectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.purple,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    unselectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.purple,
    hoverColor: AppColors.purple.withOpacity(0.1),
    hintStyle: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.purple,
    ),
    errorStyle: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.purple,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purple.withOpacity(0.1), width: 1.0),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purple.withOpacity(0.1), width: 1.0),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purple, width: 1.0),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purple, width: 1.0),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purple, width: 1.0),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(),
    displaySmall: GoogleFonts.roboto(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purple,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.silver,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purple,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purple,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purple,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  ),
  colorScheme: const ColorScheme(
    onSecondaryContainer: AppColors.orange,
    brightness: Brightness.dark,
    shadow: AppColors.red,
    surfaceTint: AppColors.black,
    outline: AppColors.lightSilver,
    primary: AppColors.lightSilver,
    onPrimary: AppColors.lightSilver,
    secondary: AppColors.silver,
    onSecondary: AppColors.lightSilver,
    error: AppColors.lightSilver,
    onError: AppColors.lightSilver,
    onBackground: AppColors.lightSilver,
    surface: AppColors.lightSilver,
    onPrimaryContainer: AppColors.purple,
    onSurface: AppColors.whiteIce,
    background: AppColors.white,
  ),
);
