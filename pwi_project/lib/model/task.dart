import 'dart:ui';

class Task {
  String id;
  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone = false;

  Task(this.id, this.name, this.description, this.day, this.background,
      this.isDone);
}
