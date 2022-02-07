import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(color: Colors.teal),
    iconTheme: IconThemeData(color: Colors.white54),
    textTheme: TextTheme(
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
    appBarTheme: AppBarTheme(
      color: Colors.green,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.white54),
    textTheme: TextTheme(
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
