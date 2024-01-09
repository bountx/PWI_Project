import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';

class TaskEditWidget extends StatelessWidget {
  final Task task;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color selectedColor ;
  TaskEditWidget({required this.task})
      : titleController = TextEditingController(text: task.name),
        descriptionController = TextEditingController(text: task.description),
        selectedDate = task.day,
        selectedColor = task.background;

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
              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  model.editTask(context, task);
                }),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Finish Date:'),
                        ElevatedButton(
                          onPressed: () {
                            model.selectDate(context);
                            selectedDate = model.selectedDate;
                          },
                          child: Text(DateFormat('yyyy-MM-dd HH:mm').format(selectedDate.toLocal())),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Background Color:'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: selectedColor,
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            model.selectColor(context);
                            selectedColor = model.selectedColor;
                          },
                          child: null,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}