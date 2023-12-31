import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../view_model/note_view_model.dart';
import '../view_model/task_view_model.dart';
import '../widgets/task_widget.dart';
import '../model/task.dart';
import '../model/note.dart';
import '../widgets/note_line.dart';

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
          dataSource: DataSource(Provider.of<TaskList>(context).exampleTasks,
              Provider.of<NoteViewModel>(context).notes),
          monthViewSettings: const MonthViewSettings(
            agendaItemHeight: 50,
            //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
            showAgenda: true,
          ),
          onTap: (details) {
            if (details.targetElement == CalendarElement.appointment) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(details.appointments![0].subject),
                      content: Text(details.appointments![0].notes),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            }
          },
          showDatePickerButton: true,
          view: CalendarView.month,
          appointmentBuilder: appointmentBuilder,
        ));
  }
}

Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  if (appointment.id == 0) {
    return TaskWidget(
        task: Task(appointment.subject, '', appointment.startTime,
            appointment.color, false));
  } else {
    return NoteLine(
      note: Note(
        appointment.subject,
        '',
        appointment.color,
        appointment.startTime,
      ),
      simplifiedLook: true,
    );
  }
}
