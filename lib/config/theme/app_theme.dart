import 'package:flutter/material.dart';

import 'common_theme_data.dart';

class AppTheme {
  static ThemeData getThemeByRule() {
    return commonThemeData.copyWith(
      textTheme: TextTheme(
        headline1: headline1.copyWith(fontSize: 30),
        headline2: headline2.copyWith(fontSize: 16),
        bodyText2: bodyText2.copyWith(fontSize: 15),
      ),
    );
  }
}
