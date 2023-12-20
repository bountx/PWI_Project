import 'package:flutter/material.dart';
import 'package:pwi_project/view_model/task_view_model.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget(this.name, this.description, this.day, this.background, this.isDone, this.index, {super.key});

  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}