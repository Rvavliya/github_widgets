import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstTheme {
  /// Light theme color
  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'DM Sans',
    colorSchemeSeed: ConstColor.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ConstColor.white,
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: ConstColor.white,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstColor.white,
      surfaceTintColor: ConstColor.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ConstColor.white,
      surfaceTintColor: ConstColor.white,
      scrimColor: Color.fromRGBO(41, 41, 41, 0.3),
      width: 249.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
      ),
    ),

    textTheme: const TextTheme(
      titleSmall: TextStyle(color: ConstColor.black),
      titleMedium: TextStyle(color: ConstColor.black),
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      elevation: 2.0,
      color: ConstColor.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  /// Dark theme color
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'DM Sans',
    colorSchemeSeed: ConstColor.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff151616),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: Color(0xff28272A),
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstColor.transparent,
      surfaceTintColor: ConstColor.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ConstColor.fillColorDark,
      surfaceTintColor: ConstColor.fillColorDark,
      scrimColor: Color.fromRGBO(41, 41, 41, 0.3),
      width: 249.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
      ),
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      elevation: 2.0,
      color: const Color(0xff1C1E1F),
      // surfaceTintColor: const Color(0xff1C1E1F),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // shadowColor: Colors.white.withOpacity(0.5),
    ),
  );

  static TextStyle drawerTitle(BuildContext context) => TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color:
            context.isDarkMode ? ConstColor.darkTitle : ConstColor.lightTitle,
      );

  static TextStyle drawerOption(BuildContext context) => TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color:
            context.isDarkMode ? ConstColor.darkOption : ConstColor.lightOption,
      );

  static Color fillColor(BuildContext context) =>
      context.isDarkMode ? ConstColor.fillColorDark : ConstColor.fillColorLight;

  static Color borderColor(BuildContext context) => context.isDarkMode
      ? ConstColor.white.withOpacity(0.1)
      : ConstColor.black.withOpacity(0.1);

  static TextStyle text(BuildContext context) => TextStyle(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.w500,
      );
  // Text styles
  static TextStyle lightText(BuildContext context) => TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.lexend().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );

  static TextStyle mediumText(BuildContext context) => TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.lexend().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );

  static TextStyle largeText(BuildContext context) => TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.lexend().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );

  static TextStyle titleText(BuildContext context) => TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.lexend().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );

  static TextStyle subTitleText(BuildContext context) => TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );
  static TextStyle hintText(BuildContext context) => TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: context.isDarkMode
            ? Colors.white.withOpacity(0.7)
            : ConstColor.grey,
      );
  static TextStyle appBarTitleText(BuildContext context) => TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: context.isDarkMode
            ? ConstColor.textColorDark
            : ConstColor.textColorLight,
      );
}
