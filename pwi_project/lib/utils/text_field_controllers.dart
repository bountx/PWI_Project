import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class TextFieldControllers with ChangeNotifier {
  final titleController = TextEditingController();
  final searchController = TextEditingController();
  final quillController = QuillController.basic();

  bool get hasActiveListeners => hasListeners;

  void disposeControllers() {
    // call after being done with textfields
    quillController.dispose();
    titleController.dispose();
    searchController.dispose();
  }

  void clearSearchController() {
    searchController.clear();
    notifyListeners();
  }

  void updateControllers(String title, String content) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleController.text = title;
      quillController.document = Document.fromJson(jsonDecode(content));
      notifyListeners();
    });
  }
}
