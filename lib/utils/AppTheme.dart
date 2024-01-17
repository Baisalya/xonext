import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF3498DB); // Change to your primary color
  static const Color secondaryColor = Color(0xFFE74C3C); // Change to your secondary color
  static const Color backgroundColor = Color(0xFFFFFFFF); // Change to your background color
  static const Color buttonColor = Color(0xFF27AE60); // Change to your button color
  static const Color headingTextColor = Color(0xFF333333); // Change to your heading text color
  static const Color subtitleTextColor = Color(0xFF666666); // Change to your subtitle text color
  static const Color warningErrorTextColor = Color(0xFFE74C3C); // Change to your warning/error text color

  // Textures
  static const BoxDecoration buttonDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    boxShadow: [
      BoxShadow(
        color: Color(0x40000000),
        blurRadius: 5.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  // 3D Finishing
  static const TextStyle headingTextStyle = TextStyle(
    color: headingTextColor,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: subtitleTextColor,
    fontSize: 16.0,
  );

  static const TextStyle warningErrorTextStyle = TextStyle(
    color: warningErrorTextColor,
    fontSize: 16.0,
  );
  //day and night
  static Color cardBackgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white60 // Set your dark mode background color here
          : Colors.white; // Set your light mode background color here

  static Color borderColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white // Border color in dark mode
          : Colors.black; // Border color in light mode

  static Color sliderActiveColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white // Border color in dark mode
          : Colors.black; // Border color in light mode

  static Color sliderInactiveColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white70 // Border color in dark mode
          : Colors.black38;

  static dividercolor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white60 // Border color in dark mode
          : Colors.black38;

  static Tabselector(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white60 // Border color in dark mode
          : Colors.red;
}
