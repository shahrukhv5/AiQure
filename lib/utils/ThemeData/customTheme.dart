import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  // Primary Color
  primaryColor: const Color(0xFF3661E2),
  primaryColorLight: const Color(0xFFE9EDFC).withOpacity(0.2), // 20% opacity
  primaryColorDark: const Color(0xFF333333),

  // Accent Color
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFEFF6FF), // Accent color
  ),

  // Scaffold Background Color
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    color: Color(0xFF3661E2), // AppBar background color
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFFFF), // AppBar text color
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFFFFFFF), // AppBar icons color
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFF333333), // Headline text color
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Color(0xFF333333), // Body text color
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      color: Color(0xFFFFFFFF), // Button text color
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF3661E2), // Button background color
      foregroundColor: const Color(0xFFFFFFFF), // Button text color
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // Input Decoration Theme (TextFields)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFEFF6FF), // TextField background color
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFF3661E2), // Focused border color
        width: 2,
      ),
    ),
    hintStyle: TextStyle(
      color: const Color(0xFF808080).withOpacity(0.6), // Hint text color
    ),
  ),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: Color(0xFF808080), // Divider color
    thickness: 1,
    space: 20,
  ),
);