import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';

class TaskEditWidget extends StatelessWidget {
  final Task task;
  TaskEditWidget({required this.task});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(task: task),
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
          Row(
          children:[
          IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Provider.of<TaskList>(context, listen: false).removeTask(task.id);
            Navigator.pop(context);
          },

        ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () => model.editTask(context),
                ),
            ],
          ),
            ],),
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
                          },
                          child: Text(DateFormat('yyyy-MM-dd HH:mm').format(model.selectedDate.toLocal())),
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
    );
  }
}
