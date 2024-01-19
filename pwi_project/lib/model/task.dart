import 'dart:ui';

import 'package:intl/intl.dart';

class Task {
  String id;
  String name;
  String description;
  DateTime date;
  Color color;
  bool isDone = false;

  //Convert the task to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'date': DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
        'color': color.value,
        'isDone': isDone,
      };

  //Create a Task from json
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        json['id'],
        json['name'],
        json['description'],
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(json['date']),
        Color(json['color']),
        json['isDone'],
      );

  Task(this.id, this.name, this.description, this.date, this.color,
      this.isDone);
}
