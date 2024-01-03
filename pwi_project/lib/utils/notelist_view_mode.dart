import 'package:flutter/material.dart';

class NotelistViewMode extends ChangeNotifier {
  bool isGridMode = true;

  void toggleViewMode() {
    isGridMode = !isGridMode;
    notifyListeners();
  }
}
