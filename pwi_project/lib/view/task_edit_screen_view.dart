import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';

class TaskEditWidget extends StatelessWidget {
  final Task task;

  const TaskEditWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(task: task),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: model.selectedColor,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            title: const Text(
              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
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
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      if (model.titleController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Title is too short!')),
                        );
                        return;
                      }
                      model.editTask(context);
                      Navigator.pop(context);
                      //goes back to task manager screen, omiting task view screen, temporary solution,
                      //need to change it so that the view screen updates after edit
                    },
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: model.titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground), // Set the color you want
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground), // Set the color you want
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: model.descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground), // Set the color you want
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground), // Set the color you want
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Finish Date:'),
                          ElevatedButton(
                            onPressed: () {
                              model.selectDate(context);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    model.selectedColor)),
                            child: Text(
                              DateFormat('yyyy-MM-dd HH:mm')
                                  .format(model.selectedDate.toLocal()),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Background Color:'),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: model.selectedColor,
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              model.selectColor(context);
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
      ),
    );
  }
}
