import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';
import 'task_edit_screen_view.dart';

class TaskViewWidget extends StatelessWidget {
  final Task task;

  TaskViewWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(task: task),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: model.selectedColor,
            title: Text(
              model.titleController.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<TaskList>(context, listen: false)
                          .removeTask(task.id);
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskEditWidget(
                                    task: task,
                                  )));
                    },
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                            'Finish Date'
                        ),
                        Text(
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                            DateFormat('yyyy-MM-dd HH:mm').format(model.selectedDate.toLocal())),
                      ],
                    ),
                  ),
                  Container(
                    height: 650, // media query
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: task.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 27.0,
                              ),
                            ),
                            Text(
                              task.description,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}