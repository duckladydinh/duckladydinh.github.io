import 'package:flutter/material.dart';

class ThemeModeProvider with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeModeProvider(this._themeMode);

  ThemeMode getTheme() {
    return _themeMode;
  }

  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
