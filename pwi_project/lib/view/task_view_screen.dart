import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
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
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            backgroundColor: Colors.amberAccent[200],
            title: Text(
              model.titleController.text,
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
                    icon:
                     Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TaskEditWidget(task: task,))
                      );
                    },
                  ),
              ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Finish Date:'),
                ElevatedButton(
                  onPressed: () {
                    model.viewcalendar(context);
                  },
                  child: Text(DateFormat('yyyy-MM-dd HH:mm').format(model.selectedDate.toLocal())),
                ),
                Text('Description:'),
                Expanded(
                  child: Text(task.description),
                )
              ],
            ),
            ),
          ),
        ),
    );
  }
}