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
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: AppColors.crayola,
    showSelectedLabels: true,
    selectedItemColor: AppColors.white,
    showUnselectedLabels: false,
    selectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.crayola,
    ),
    unselectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.crayola,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    unselectedIconTheme: const IconThemeData(
      color: AppColors.whiteIce,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.crayola,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.crayola,
    hoverColor: AppColors.crayola.withOpacity(0.1),
    hintStyle: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.crayola,
    ),
    errorStyle: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.crayola,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.crayola.withOpacity(0.1), width: 1.0),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.crayola.withOpacity(0.1), width: 1.0),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.crayola, width: 1.0),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.crayola, width: 1.0),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.crayola, width: 1.0),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(),
    displaySmall: GoogleFonts.roboto(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: AppColors.crayola,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.crayola,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.crayola,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.crayola,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    onSecondary: AppColors.salmon,
    onSurface: AppColors.whiteIce,
    background: AppColors.white,
    secondary: AppColors.silver,
    onPrimary: AppColors.lightSilver,
    surface: AppColors.cerulian,
    onBackground: AppColors.black,
    primary: AppColors.crayola,

    error: AppColors.lightSilver,
    onError: AppColors.lightSilver,
  ),
);
