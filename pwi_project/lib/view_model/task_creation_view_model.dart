import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view_model/task_view_model.dart';

class TaskCreationViewModel extends ChangeNotifier {
  final Task task;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color selectedColor;

  TaskCreationViewModel({required this.task})
      : titleController = TextEditingController(text: task.name),
        descriptionController = TextEditingController(text: task.description),
        selectedDate = task.date,
        selectedColor = task.color;

  Future<void> selectDate(BuildContext context) async {
    final ThemeData themeData = Theme.of(context);
    final DateTime now = DateTime.now();
    final DateTime initialDate =
        selectedDate.isBefore(now) ? now : selectedDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: themeData.colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.onBackground,
              surface: Theme.of(context).colorScheme.background,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  void selectColor(BuildContext context) {
    List<Color> colors = [
      const Color(0xFFFA9198),
      const Color(0xFFFCAE7C),
      const Color(0xFFEFB949),
      const Color(0xFFECCD7B),
      const Color(0xFFB3F5BC),
      const Color(0xFF9EDFEC),
      const Color(0xFFE2CBF7),
      const Color(0xFFC1A1FF),
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          backgroundColor: Theme.of(context).colorScheme.background,
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: List.generate(colors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      selectedColor = colors[index];
                      notifyListeners();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Got it',
                style: TextStyle(
                  fontSize: 21,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // addTask is function that creates a new task and adds it to the list of tasks
  void addTask(BuildContext context) {
    Task newTask = Task(
      task.id,
      titleController.text,
      descriptionController.text,
      selectedDate,
      selectedColor,
      false,
    );
    Provider.of<TaskViewModel>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    notifyListeners();
  }

  void editTask(BuildContext context) {
    Task newTask = Task(
      task.id,
      titleController.text,
      descriptionController.text,
      selectedDate,
      selectedColor,
      false,
    );

    Provider.of<TaskViewModel>(context, listen: false).editTask(
      task.id,
      newTask,
    );
    Navigator.pop(context);
    notifyListeners();
  }
}
