import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  String language = 'en';

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
