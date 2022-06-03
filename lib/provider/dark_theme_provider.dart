
import 'package:flutter/material.dart';
import 'package:hamo_home_service/helper/dark_theme_helper.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemeHelper darkThemePreference = DarkThemeHelper();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}