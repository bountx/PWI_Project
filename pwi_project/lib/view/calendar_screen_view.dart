import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../view_model/task_view_model.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Screen'),
      ),
      body: SfCalendar(
        onSelectionChanged: (selection){
          print(Provider.of<Calendar>(context, listen: false).controller.selectedDate);
        },
        controller: Provider.of<Calendar>(context).controller,
        view: CalendarView.month,
        dataSource: TasksDataSource(Provider.of<TaskList>(context).exampleTasks),
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
      )
    );
  }
}
