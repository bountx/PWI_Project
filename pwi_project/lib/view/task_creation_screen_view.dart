import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view_model/task_view_model.dart';

class TaskCreationViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.amber;

      Future<void> _selectDate(BuildContext context) async {
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

  void _selectColor(BuildContext context) {
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

class TaskCreationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            backgroundColor: Colors.amberAccent[200],
            title: Text(
              'Create Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () => model.addTask(context),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: model.titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: model.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                Text('Finish Date: ${model.selectedDate.toLocal()}'),
                ElevatedButton(
                  onPressed: () => model._selectDate(context),
                  child: Text('Select Finish Date'),
                ),
                SizedBox(height: 20),
                Text('Background Color:'),
                ElevatedButton(
                  onPressed: () => model._selectColor(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: model.selectedColor),
                  child: Text('Select Color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
