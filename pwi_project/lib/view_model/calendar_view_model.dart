import 'package:flutter/material.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'note_view_model.dart';

class Calendar extends ChangeNotifier {
  final _controller = CalendarController();

  CalendarController get controller => _controller;
}

class DataSource extends CalendarDataSource {
  DataSource(List<Task> taskSource, List<Note> noteSource) {
    appointments = [];
    for(Task task in taskSource){
      Appointment taskAppointment = Appointment(
        subject: task.name,
        startTime: task.day,
        endTime: task.day,
        color: task.background,
        notes: task.description,
        isAllDay: true,
      );
      appointments?.add(taskAppointment);
    }
    for(Note note in noteSource){
      Appointment noteAppointment = Appointment(
        subject: note.name,
        startTime: note.day,
        endTime: note.day,
        color: note.background,
        notes: note.description,
        isAllDay: true,
      );
      appointments?.add(noteAppointment);
    }
  }
}