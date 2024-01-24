import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';
import 'task_edit_screen_view.dart';

class TaskViewWidget extends StatelessWidget {
  final Task task;

  const TaskViewWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(task: task),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: model.selectedColor,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            title: Text(
              model.titleController.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<TaskViewModel>(context, listen: false)
                          .removeTask(task.id);
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              'Finish Date'),
                          Text(
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              DateFormat('yyyy-MM-dd HH:mm')
                                  .format(model.selectedDate.toLocal())),
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight - 200,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: task.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 27.0,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                              Text(
                                task.description,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
