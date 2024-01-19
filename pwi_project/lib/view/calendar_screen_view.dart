import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/note.dart';
import '../model/task.dart';
import '../view_model/note_view_model.dart';
import '../view_model/task_view_model.dart';
import '../widgets/note_line.dart';
import '../widgets/task_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SfCalendar(
            backgroundColor: Theme.of(context).colorScheme.background,
            onSelectionChanged: (selection) {},
            todayHighlightColor: Theme.of(context).colorScheme.secondary,
            controller: Provider.of<Calendar>(context).controller,
            dataSource: DataSource(Provider.of<TaskList>(context).tasks,
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
                            child: Text(
                                'OK',
                                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                            ),
                          ),
                        ],
                      );
                    });
              }
            },
            showDatePickerButton: true,
            view: CalendarView.month,
            appointmentBuilder: appointmentBuilder,
          ),
        ));
  }
}

Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  if (appointment.id == 0) {
    return Flexible(
      child: TaskWidget(
          task: Task(appointment.id.toString(),appointment.subject,'', appointment.startTime,
              appointment.color, false), showDate: false,
      
      ),
    );

  } else {
    return NoteLine(
      note: Note(
        appointment.subject,
        '',
        appointment.color,
        appointment.startTime,
      ),
    );
  }
}
