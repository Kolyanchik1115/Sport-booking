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
    backgroundColor: AppColors.purpleDark,
    showSelectedLabels: true,
    selectedItemColor: AppColors.white,
    showUnselectedLabels: false,
    selectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.purpleDark,
    ),
    unselectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.purpleDark,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    unselectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.purpleDark,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.purpleDark,
    hoverColor: AppColors.purpleDark.withOpacity(0.1),
    hintStyle: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.purpleDark,
    ),
    errorStyle: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.purpleDark,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purpleDark.withOpacity(0.1), width: 1.0),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purpleDark.withOpacity(0.1), width: 1.0),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purpleDark, width: 1.0),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purpleDark, width: 1.0),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.purpleDark, width: 1.0),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(),
    displayMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purpleDark,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.purpleDark,
    ),
  ),
  colorScheme: const ColorScheme(
    onSecondaryContainer: AppColors.blueLight,
    brightness: Brightness.dark,
    shadow: AppColors.greenLite,
    surfaceTint: AppColors.greenDark,
    outline: AppColors.yellowLight,
    primary: AppColors.blueLight,
    onPrimary: AppColors.blueLight,
    secondary: AppColors.blueLight,
    onSecondary: AppColors.blueLight,
    error: AppColors.blueLight,
    onError: AppColors.blueLight,
    onBackground: AppColors.blueLight,
    surface: AppColors.blueLight,
    onPrimaryContainer: AppColors.purpleDark,
    onSurface: AppColors.blueLight,
    background: AppColors.white,
  ),
);
