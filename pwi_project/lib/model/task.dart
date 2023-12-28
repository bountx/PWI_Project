import 'dart:ui';

class Task {
  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone = false;
  Task(this.name, this.description, this.day, this.background, this.isDone);
}