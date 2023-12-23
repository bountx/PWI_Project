import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
import '../view_model/task_view_model.dart';

class TaskCreation extends StatelessWidget {
  TaskCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Creation'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Go to the next page',
            onPressed: () {
              Provider.of<TaskList>(context, listen: false).addTask(
                Task(
                  Provider.of<TaskList>(context, listen: false).tasks.length.toString(),
                  'a lot a lot',
                  DateTime.now(),
                  const Color(0xFF0F8644),
                  false,
                ),
              );
              Navigator.pop(context);
            }
       ),
      ],
     ),
    );
  }
}