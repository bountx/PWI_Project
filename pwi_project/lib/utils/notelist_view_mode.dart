import 'package:flutter/material.dart';

class NotelistViewMode extends ChangeNotifier {
  bool isTileMode = true;

  void toggleViewMode() {
    isTileMode = !isTileMode;
    notifyListeners();
  }
}
