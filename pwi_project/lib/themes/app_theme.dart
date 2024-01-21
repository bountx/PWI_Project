import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFFFEB3B), //AppBars
          onPrimary: Color(0xFFffffff),
          secondary: Color(0xFFFFD600), //Buttons
          onSecondary: Color(0xFF2A2006),
          error: Color(0xFFEE4545),
          onError: Color(0xFF800808),
          background: Color(0xFFFFFCB3),
          onBackground: Color(0xFF2A2006),
          surface: Color(0xFFFAD95D),
          onSurface: Color(0xFF2A2006),
          surfaceVariant: Color(0xFFFFC400),
          tertiary: Color(0xFFC29B00),

      ),
      splashColor: Color(0xFFFFE082),
      secondaryHeaderColor: Colors.grey[700],
  );

  static final ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFD2A60D), //AppBars
          onPrimary: Color(0xFF1F1806),
          secondary: Color(0xFFB48F0F), //Buttons
          onSecondary: Color(0xFF1F1806),
          error: Color(0xFFEE4545),
          onError: Color(0xFF800808),
          background: Color(0xFF1F1806),
          onBackground: Color(0xFFFFFCB3),
          surface: Color(0xFF866207),
          onSurface: Color(0xFFFFFCB3),
          surfaceVariant: Color(0xFFAB903D),
          tertiary: Color(0xFFB48F0F),

      ),
      splashColor: Color(0xFFFFE082),
      secondaryHeaderColor: Color(0xFFFFFCB3),
  );
}