import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: bgColorLight,
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(
        color: Colors.white,
      ),
      dividerColor: Colors.white54,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: bgColorDark,
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(
        color: Colors.black,
      ),
      dividerColor: Colors.black12,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
