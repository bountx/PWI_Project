import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/random_string.dart';
import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';
import 'package:uuid/uuid.dart';


class TaskCreationWidget extends StatelessWidget {
  const TaskCreationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(task: Task('T${generateRandomString(16)}','', '', DateTime.now(), Color(0xFFEFB949) , false)),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Create Task',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                    Icons.check,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
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
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                      enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground), // Set the color you want
                  ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground), // Set the color you want
                    ),
                ),
                ),
                TextFormField(
                  controller: model.descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground), // Set the color you want
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground), // Set the color you want
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Finish Date:'),
                        ElevatedButton(
                            onPressed: () => model.selectDate(context),
                            child: Text(
                              DateFormat('yyyy-MM-dd HH:mm').format(model.selectedDate.toLocal()),
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                            ),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)),
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Background Color:'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: model.selectedColor,
                            shape: CircleBorder(),
                          ),
                          onPressed: () => model.selectColor(context),
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
