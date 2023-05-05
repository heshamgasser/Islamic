import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color kPrimaryColor = Color(0xFFB7935F);

  static const Color kDarkPrimaryColor = Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFFd6d5d5),
          onPrimary: const Color(0xFFB7935F),
          secondary: const Color(0xFFB7935F),
          onSecondary: const Color(0xFFB7935F),
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: const Color(0xFFB7935F),
          surface: Colors.white.withOpacity(.6),
          onSurface: Colors.black),
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      dividerColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        titleLarge: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'ElMessiri'),
        bodyMedium: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'ElMessiri'),
        bodyLarge: GoogleFonts.notoKufiArabic(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        bodySmall: GoogleFonts.notoKufiArabic(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        titleSmall: const TextStyle(fontFamily: 'JfFlat', fontSize: 12),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontFamily: 'JfFlat', fontSize: 12, color: Colors.black),
        unselectedLabelStyle:
            TextStyle(fontFamily: 'JfFlat', fontSize: 12, color: Colors.white),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent);

  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: const Color(0xFF141A2E),
          onPrimary: const Color(0xFFFACC1D),
          secondary: const Color(0xFFB7935F),
          onSecondary: const Color(0xFFFACC1D),
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: const Color(0xFFFACC1D),
          surface: const Color(0xFF141A2E).withOpacity(0.6),
          onSurface: const Color(0xFFFACC1D)),
      brightness: Brightness.dark,
      primaryColor: kDarkPrimaryColor,
      dividerColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        titleLarge: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'ElMessiri'),
        bodyMedium: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'ElMessiri'),
        bodyLarge: GoogleFonts.notoKufiArabic(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        bodySmall: GoogleFonts.notoKufiArabic(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: const TextStyle(fontFamily: 'JfFlat', fontSize: 12),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF141A2E),
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        selectedItemColor: Color(0xFFFACC1D),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontFamily: 'JfFlat',
          fontSize: 12,
          color: Color(0xFFFACC1D),
        ),
        unselectedLabelStyle:
            TextStyle(fontFamily: 'JfFlat', fontSize: 12, color: Colors.white),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent);
}
