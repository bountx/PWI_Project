import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/note.dart';
import '../model/task.dart';

class Calendar extends ChangeNotifier {
  final _controller = CalendarController();

  CalendarController get controller => _controller;
}

//Data source for calendar
//transforming data from task and note to appointment
class DataSource extends CalendarDataSource {
  DataSource(List<Task> taskSource, List<Note> noteSource) {
    appointments = [];
    for (Task task in taskSource) {
      Appointment taskAppointment = Appointment(
        id: 0,
        subject: task.name,
        startTime: task.day,
        endTime: task.day,
        color: task.background,
        notes: task.description,
        isAllDay: true,
      );
      appointments?.add(taskAppointment);
    }
    for (Note note in noteSource) {
      Appointment noteAppointment = Appointment(
        id: 1,
        subject: note.title,
        startTime: note.date,
        endTime: note.date,
        color: note.color,
        notes: note.content,
        isAllDay: true,
      );
      appointments?.add(noteAppointment);
    }
  }
}
