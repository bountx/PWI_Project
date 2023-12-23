import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
import '../view_model/task_view_model.dart';


class TaskCreation extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController finishDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Creation'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Confirm task creation',
            onPressed: () {
              String title = titleController.text;
              String description = descriptionController.text;
              DateTime finishDate = DateTime.parse(finishDateController.text);
              /*Provider.of<TaskList>(context, listen: false).addTask(
                Task(
                  title,
                  description,
                  finishDate,
                  const Color(0xFF0F8644),
                  false,
                ),
              );*/
              Navigator.pop(context);
            }
       ),
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
                              TextFormField(
                              controller: finishDateController,
                              decoration: InputDecoration(labelText: 'Finish Date'),
                              ),
                              SizedBox(height: 20),
             ],
            ),
        ),
    );
  }
}