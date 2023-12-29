import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
import 'package:pwi_project/widgets/task_widget.dart';

import '../model/task.dart';
import '../view_model/task_view_model.dart';

class TaskManagerScreen extends StatelessWidget {
  TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.amberAccent[400],
        ),
      ),
      backgroundColor: Colors.orange[50],
      body: Consumer<TaskList>(
        builder: (context, taskList, child) {
          return ListView.builder(
            itemCount: taskList.tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                child: TaskWidget(task: Task(
                  taskList.tasks[index].name,
                  taskList.tasks[index].description,
                  taskList.tasks[index].day,
                  taskList.tasks[index].background,
                  false
                ),
                ),
              );
            },
          );
        },
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
          backgroundColor: Colors.amberAccent[400],
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
            ),
          )),
    );
  }
}
