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

  Future<void> viewcalendar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(200),
      lastDate: DateTime(2101),
    );
  }

  void selectColor(BuildContext context) {
    List<Color> colors = [
      Color(0xFFFA9198),
      Color(0xFFFCAE7C),
      Color(0xFFEFB949),
      Color(0xFFECCD7B),
      Color(0xFFB3F5BC),
      Color(0xFF9EDFEC),
      Color(0xFFE2CBF7),
      Color(0xFFC1A1FF),
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: Container(
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
                      margin: EdgeInsets.all(5),
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
              child: const Text(
                  'Got it',
                  style: TextStyle(
                    fontSize: 21
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
    Provider.of<TaskList>(context, listen: false).editTask(
      task.id,
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