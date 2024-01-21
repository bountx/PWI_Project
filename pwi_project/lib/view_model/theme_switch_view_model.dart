import 'package:flutter/material.dart';
import 'package:pwi_project/utils/memory_management.dart';


class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}