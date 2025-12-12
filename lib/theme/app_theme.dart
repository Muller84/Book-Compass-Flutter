import 'package:flutter/material.dart';

// constants for colors
const kPrimaryGreen = Color(0xFF27AE60); // primary green color
const kBackgroundCream = Color(0xFFFDF6EC); // light cream background color
const kTextMain = Color(0xFF222222); // main text color
const kTextSecondary = Color(0xFF777777); // secondary text color
const kInputFill = Color(0xFFF5F5F5); // input field fill color
const kInputBorder = Color(0xFFDDDDDD); // input field border color
const kPrimaryColor = Color.fromARGB(255, 8, 160, 69);


const kLogoHeight = 100.0; // height of the logo image

const kSpacingExtraSmall = 4.0;
const kSpacingSmall = 8.0;
const kSpacingMedium = 16.0;
const kSpacingLarge = 24.0;
const kSpacingExtraLarge = 40.0;

// blobal theme definition
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundCream,
  primaryColor: kPrimaryGreen,
  fontFamily: 'Nunito',

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      color: kTextMain,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
      color: kTextMain,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: kTextMain,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: kTextSecondary,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
  ), // TextTheme

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kInputFill,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kInputBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kInputBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryGreen, width: 2),
    ),
    labelStyle: const TextStyle(
      color: kTextSecondary,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: kTextSecondary,
      fontSize: 14,
    ),
  ), // InputDecorationTheme

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryGreen,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      textStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  ), // ElevatedButtonThemeData

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: kBackgroundCream,
  selectedItemColor: kPrimaryGreen,
  unselectedItemColor: kTextSecondary,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
  elevation: 0,
),
 // BottomNavigationBarThemeData

);


