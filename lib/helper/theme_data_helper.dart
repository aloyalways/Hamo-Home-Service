import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamo_home_service/constants/colors.dart';

class ThemeDataHelper {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      backgroundColor: isDarkTheme ? darkBg : white,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: isDarkTheme ? white : black
        )
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      iconTheme: IconThemeData(
        color: isDarkTheme ? white : black
      )
    );
  }
}