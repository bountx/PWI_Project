import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../view_model/note_view_model.dart';
import '../view_model/task_view_model.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calendar Screen'),
        ),
        body: SfCalendar(
          onSelectionChanged: (selection) {},
          controller: Provider.of<Calendar>(context).controller,
          dataSource: DataSource(
              Provider.of<TaskList>(context).exampleTasks,
              Provider.of<NoteList>(context).exampleNotes),
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            showAgenda: true,
          ),
          showDatePickerButton: true,
          view: CalendarView.month,
        ));
  }
}
