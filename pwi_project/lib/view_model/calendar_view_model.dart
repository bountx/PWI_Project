import 'package:flutter/material.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends ChangeNotifier {
  final _controller = CalendarController();

  CalendarController get controller => _controller;
}

class TasksDataSource extends CalendarDataSource {
  TasksDataSource(List<Task> source) {
    appointments = [];
    for(Task task in source){
      Appointment appointment = Appointment(
        subject: task.name,
        startTime: task.day,
        endTime: task.day.add(const Duration(hours: 2)),
        color: task.background,
        notes: task.description,
        isAllDay: true,
      );
      appointments?.add(appointment);
    }
  }
}