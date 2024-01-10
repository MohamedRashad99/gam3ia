import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0XFF00b3b3);
  static Color second = const Color(0XFF00b3b3);
  static Color third = const Color(0xFF2A2A4E);
  static Color loadingColor = const Color(0xFFAC2F2F);
  static Color goldColor = const Color(0xFFe2ae17);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: GoogleFonts.cairoTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.primary,
    // toggleableActiveColor: AppColors.primary,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      // color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: context.textTheme.titleLarge!.copyWith(
          color: AppColors.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.third, size: 30),
    ),
    dividerColor: Colors.transparent,
    radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black)),
    indicatorColor: AppColors.loadingColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.loadingColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  );
}
