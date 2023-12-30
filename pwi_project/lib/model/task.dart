import 'dart:ui';
import 'package:uuid/uuid.dart';

class Task {
  String id = Uuid().v4();
  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone = false;
  Task(this.name, this.description, this.day, this.background, this.isDone);
}