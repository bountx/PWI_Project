import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Task {
  Task(this.name, this.description, this.day, this.background);
  String name;
  String description;
  DateTime day;
  Color background;
}

//provider will be here later
class TaskList extends ChangeNotifier {
  List<Task> get exampleTasks => [
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
  ];
}