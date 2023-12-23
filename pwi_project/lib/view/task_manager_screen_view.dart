import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/task_view_model.dart';
import '../widgets/task_widget.dart';

class TaskManagerScreen extends StatelessWidget {
  TaskManagerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(153, 217, 234, 1.0),
      body: SingleChildScrollView(
        child: Column(
            verticalDirection: VerticalDirection.down,
            children: Provider.of<TaskList>(context).taskWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.blueAccent,
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              'New task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          )),
    );
  }
}
