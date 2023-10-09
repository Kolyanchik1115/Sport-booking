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
      // systemNavigationBarColor: AppColors.greenBice,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    // backgroundColor: AppColors.greenBice,
    showSelectedLabels: true,
    selectedItemColor: AppColors.white,
    showUnselectedLabels: false,
    selectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    unselectedLabelStyle: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.white.withOpacity(0.6),
    ),
  ),
  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: AppColors.greenBice,
  // ),
  // inputDecorationTheme: InputDecorationTheme(
  //   focusColor: AppColors.greenBice,
  //   hoverColor: AppColors.greenCharleston.withOpacity(0.1),
  //   hintStyle: GoogleFonts.roboto(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: AppColors.silver,
  //   ),
  //   errorStyle: GoogleFonts.roboto(
  //     fontSize: 12,
  //     fontWeight: FontWeight.w400,
  //     color: AppColors.red,
  //   ),
  //   enabledBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //         color: AppColors.greenCharleston.withOpacity(0.1), width: 1.0),
  //   ),
  //   focusedBorder: const UnderlineInputBorder(
  //     borderSide: BorderSide(color: AppColors.greenBice, width: 1.0),
  //   ),
  //   errorBorder: const UnderlineInputBorder(
  //     borderSide: BorderSide(color: AppColors.red, width: 1.0),
  //   ),
  //   focusedErrorBorder: const UnderlineInputBorder(
  //     borderSide: BorderSide(color: AppColors.red, width: 1.0),
  //   ),
  // ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(),
    displayMedium: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    // headlineLarge: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.greenBice,
    // ),
    // headlineMedium: GoogleFonts.roboto(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.greenBice,
    // ),
    // headlineSmall: GoogleFonts.roboto(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.greenCharleston,
    // ),
    // titleLarge: GoogleFonts.roboto(
    //   fontSize: 20.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.greenCharleston,
    // ),
    // titleMedium: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.greenCharleston,
    // ),
    // titleSmall: GoogleFonts.roboto(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.greenCharleston,
    // ),
    // bodyLarge: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.greenCharleston.withOpacity(0.6),
    // ),
    // bodyMedium: GoogleFonts.roboto(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.greenCharleston.withOpacity(0.6),
    // ),
    // bodySmall: GoogleFonts.roboto(
    //   fontSize: 12.0,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.greenCharleston.withOpacity(0.6),
    // ),
    // labelLarge: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.silver,
    // ),
    // labelMedium: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.greenCharleston,
    // ),
    // labelSmall: GoogleFonts.roboto(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w400,
    //   letterSpacing: 0,
    //   color: AppColors.silver,
    // ),
  ),
  // colorScheme: const ColorScheme(
  //   onSecondaryContainer: AppColors.silver,
  //   brightness: Brightness.dark,
  //   shadow: AppColors.purpleRoyal,
  //   surfaceTint: AppColors.purpleRoyal,
  //   outline: AppColors.purpleRoyal,
  //   // primary: AppColors.greenBice,
  //   // onPrimary: AppColors.silver,
  //   // secondary: AppColors.greenCharleston,
  //   // onSecondary: AppColors.greenBice,
  //   // error: AppColors.red,
  //   // onError: AppColors.red,
  //   // onBackground: AppColors.whiteIce,
  //   // surface: AppColors.blackEerie,
  //   onPrimaryContainer: AppColors.purpleRoyal,
  //   onSurface: AppColors.purpleRoyal,
  //   background: AppColors.white,
  // ),
);
