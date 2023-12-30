import 'package:flutter/material.dart';

class TextFieldControllers with ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  bool get hasActiveListeners => hasListeners;

  void disposeControllers() {  // call after being done with textfields
    titleController.dispose();
    contentController.dispose();
  }
}