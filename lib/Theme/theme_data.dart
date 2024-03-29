import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(color: Colors.teal),
    iconTheme: const IconThemeData(color: Colors.white54),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.green,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.green,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white54),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.green,
        fontSize: 20.0,
      ),
      headline2: TextStyle(
        color: Colors.green,
        fontSize: 18.0,
      ),
    ),
  );

  //
  static final ThemeData light2 = ThemeData.light().copyWith();

  static final ThemeData dark2 = ThemeData.dark().copyWith();
}
