import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle {
  static const Color primary700 = const Color(0xFF640F0F);
  static const Color primary500 = const Color(0xFFC71D1D);
  static const Color primary400 = const Color(0xFFC54646);
  static const Color primary300 = const Color(0xFFE38E83);
  static const Color primary200 = const Color(0xFFF1C6C6);
  static const Color primary100 = const Color(0xFFFAEBEB);

  static const Color secondary700 = const Color(0xFF10121A);
  static const Color secondary500 = const Color(0xFF202433);
  static const Color secondary400 = const Color(0xFF383B46);
  static const Color secondary300 = const Color(0xFF6A6E7B);
  static const Color secondary200 = const Color(0xFFC7C8CC);
  static const Color secondary100 = const Color(0xFFEFEFF0);

  static const Color success = const Color(0xFF3FD65F);
  static const Color successLight = const Color(0xFFDFF8E6);
  static const Color attention = const Color(0xFFFFBF00);
  static const Color attentionLight = const Color(0xFFFFF5D7);
  static const Color error = const Color(0xFFF15F5F);
  static const Color errorLight = const Color(0xFFFEE6E6);

  static const Color primaryColor = primary500;
  static const Color disablePrimaryColor = const Color(0xFFFFC4C6);

  static const Color shimmerBaseColor = const Color(0xFFEFEFF0);
  static const Color shimmerHighlightColor = const Color(0xFFFFFFFF);

  static const String fontFamily = 'NunitoSans';
  static const double horizontalPadding = 32;
  static const EdgeInsets defaultHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 32);

  static final theme = ThemeData(
    primaryColor: const Color(0xFFFFFFFF),
    accentColor: secondary100,
    disabledColor: secondary100,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 10,
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.black.withOpacity(.1),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppStyle.primaryColor,
      ),
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        fontSize: 12.0,
        letterSpacing: 0.5,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12.0,
        letterSpacing: 0.5,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: const TextStyle(
        color: primary500,
        fontSize: 12.0,
        letterSpacing: 0.5,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
      ),
      prefixStyle: const TextStyle(
        color: const Color(0xFF121212),
        fontSize: 16.0,
        letterSpacing: 0.7,
        fontFamily: fontFamily,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color(0xFFE0E0E0),
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color(0xFF82868C),
        ),
      ),
      errorStyle: const TextStyle(
        color: const Color(0xFFE6242A),
        fontSize: 10.0,
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color(0xFFBD0E14),
        ),
      ),
    ),
    textTheme: const TextTheme(
      body1: TextStyle(
        fontFamily: fontFamily,
      ),
      body2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.0,
      ),
      button: TextStyle(
        color: primary500,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        letterSpacing: 0.8,
      ),
      caption: TextStyle(
        fontFamily: fontFamily,
      ),
      display1: TextStyle(
        fontFamily: fontFamily,
      ),
      display2: TextStyle(
        fontFamily: fontFamily,
      ),
      display3: TextStyle(
        fontFamily: fontFamily,
      ),
      display4: TextStyle(
        fontFamily: fontFamily,
      ),
      headline: TextStyle(
        fontFamily: fontFamily,
      ),
      subhead: TextStyle(
        color: Color(0xFF121212),
        fontFamily: fontFamily,
      ),
      title: TextStyle(
        fontSize: 18.0,
        fontFamily: fontFamily,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primary500,
      disabledColor: secondary100,
      focusColor: primary500,
      colorScheme: const ColorScheme(
        primary: Color(0xFFEB3237),
        primaryVariant: Color(0xFFEB3237),
        onPrimary: Colors.green,
        secondary: Color(0xFFFFFFFF),
        secondaryVariant: Color(0xFFFFFFFF),
        onSecondary: Colors.white,
        background: Color(0xFFEB3237),
        onBackground: Color(0xFFFFFFFF),
        brightness: Brightness.light,
        error: Color(0xFFEB3237),
        onError: Color(0xFFEB3237),
        surface: Color(0xFFEB3237),
        onSurface: Color(0xFFEB3237),
      ),
      height: 60.0,
      padding: const EdgeInsets.all(0),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
