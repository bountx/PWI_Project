import 'package:flutter/material.dart';
import 'package:pwi_project/utils/memory_management.dart';


class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeProvider(this.isDarkMode){
    loadTheme();
  }

  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    saveThemeInMemory(isDarkMode);
    notifyListeners();
  }

  void loadTheme() async {
    isDarkMode = await loadThemeFromMemory();
    notifyListeners();
  }
}