import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../model/task.dart';
import '../view_model/task_view_model.dart';

class TaskCreationViewModel extends ChangeNotifier {
  final Task task;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color selectedColor ;
  TaskCreationViewModel({required this.task})
      : titleController = TextEditingController(text: task.name),
        descriptionController = TextEditingController(text: task.description),
        selectedDate = task.day,
        selectedColor = task.background;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  void selectColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                selectedColor = color;
                notifyListeners();
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addTask(BuildContext context) {
    Provider.of<TaskList>(context, listen: false).addTask(
      Task(
        task.id,
        titleController.text,
        descriptionController.text,
        selectedDate,
        selectedColor,
        false,
      ),
    );
    Navigator.pop(context);
    notifyListeners();
  }
  void editTask(BuildContext context) {
    Provider.of<TaskList>(context, listen: false).editTask(task.id,
      Task(
        task.id,
        titleController.text,
        descriptionController.text,
        selectedDate,
        selectedColor,
        false,
      ),
    );
    Navigator.pop(context);
    notifyListeners();
  }
}
