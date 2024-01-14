import 'package:flutter/material.dart';

class NotelistViewMode extends ChangeNotifier {
  bool _isGridMode = true;

  bool get isGridMode => _isGridMode;

  void toggleViewMode() {
    _isGridMode = !_isGridMode;
    notifyListeners();
  }
}

class NotepadViewMode with ChangeNotifier {
  bool _isEditing = false;

  bool get isEditing => _isEditing;

  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  void toggleEditMode() {
    _isEditing = !_isEditing;
    notifyListeners();
  }
}
