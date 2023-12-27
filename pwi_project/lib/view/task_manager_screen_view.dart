import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskCreationWidget()),
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
