import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primaryVariant = Color(0XFF212121);
Color onPrimary = const Color(0xFFFFFFFF);

var appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Color(0xFFE2F0F9),
  ),
  fontFamily: 'Poppins',
  colorScheme: ColorScheme(
    tertiary: const Color(0xFF8DB8D0),
    background: Colors.white,
    primary: Colors.black,
    secondary: const Color(0xFFFEAF41),
    surface: Colors.white,
    error: Colors.red,
    onPrimary: onPrimary,
    onSecondary: Colors.white,
    onSurface: const Color(0xFF44697E),
    onBackground: const Color(0xFF09324A),
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  hintColor: Color.fromARGB(255, 83, 112, 129),
  textTheme: textTheme,
  scaffoldBackgroundColor: Color(0XffEFEFEF),
);

var textTheme = TextTheme(
  headline1: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    color: Color(0xFF212121),
    fontWeight: FontWeight.bold,
  ),
  headline2: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    color: Color(0xFF212121),
    fontWeight: FontWeight.bold,
  ),
  headline3: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    color: Color(0xFF303030),
    fontWeight: FontWeight.bold,
  ),
  // error text color
  subtitle1: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    color: const Color(0xFF44697E),
    fontWeight: FontWeight.normal,
  ),
  // primary button color
  // will change with the theme
  subtitle2: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    color: Color(0xFF44697E),
    fontWeight: FontWeight.normal,
  ),
  bodyText1: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ),
  bodyText2: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ),
  caption: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    color: Color(0xff303030),
  ),
  // normal button color
  // static (update, delete etc)
  button: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: const Color(0xFF212121),
    fontWeight: FontWeight.bold,
  ),
  overline: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    letterSpacing: 0,
    color: primaryVariant,
    fontWeight: FontWeight.normal,
  ),
);
