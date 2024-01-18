import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFFFEB3B), //AppBars
          onPrimary: Color(0xFF2A2006),
          secondary: Color(0xFFFFD600), //Buttons
          onSecondary: Color(0xFF2A2006),
          error: Color(0xFFEE4545),
          onError: Color(0xFF800808),
          background: Color(0xFFFFFCB3),
          onBackground: Color(0xFF2A2006),
          surface: Color(0xFFFFD740),
          onSurface: Color(0xFF2A2006),
          surfaceVariant: Color(0xFFFFC400)

      ),
      splashColor: Color(0xFFFFE082),
  );
}