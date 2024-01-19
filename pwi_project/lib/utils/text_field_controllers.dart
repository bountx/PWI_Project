import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class TextFieldControllers with ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final searchController = TextEditingController();
  final quillController = QuillController.basic();

  bool get hasActiveListeners => hasListeners;

  void disposeControllers() {
    // call after being done with textfields
    quillController.dispose();
    titleController.dispose();
    contentController.dispose();
    searchController.dispose();
  }

  void updateControllers(String title, String content) {
    titleController.text = title;
    //contentController.text = content;
    quillController.document=Document.fromJson(jsonDecode(content));
    notifyListeners();
  }
}
