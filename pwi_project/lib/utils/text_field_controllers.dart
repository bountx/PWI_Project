import 'package:flutter/material.dart';

class TextFieldControllers with ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void disposeControllers() {
    titleController.dispose();
    contentController.dispose();
  }
}