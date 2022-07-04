import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

/* Good Google Fonts
    - noto
    - fira
    - pangolin
    - fugazOne
*/
final commonThemeData = ThemeData(
  primaryColor: kPrimary,
  primaryColorLight: kPrimary,
  scaffoldBackgroundColor: kBackgroundScaffold,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(110, 40),
      textStyle:
          GoogleFonts.firaSans(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  ),
);

final headline1 = GoogleFonts.pangolin(
  color: kBlack,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.5,
);

final headline2 = GoogleFonts.notoSans(
  color: kBlack,
  fontWeight: FontWeight.w400,
);

final headline3 = GoogleFonts.firaSans(
  color: kBlack,
  fontWeight: FontWeight.w300,
);

final bodyText2 = GoogleFonts.firaSans(
  color: kBlack,
  fontWeight: FontWeight.w400,
);
