import 'package:duckladydinh/api/models.dart';
import 'package:flutter/material.dart';

abstract class DataProvider {
  String getAuthor();

  String getAuthorDayTitle();

  String getAuthorNightTitle();

  List<Idiom> getIdioms();

  List<Event> getEvents();

  Image getProfileIcon();

  ImageProvider getMoonIcon();

  ImageProvider getSunIcon();

  List<PageReference> getExternalPageReferences();

  BoxDecoration getNightWallpaper();

  BoxDecoration getDayWallpaper();
}

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
