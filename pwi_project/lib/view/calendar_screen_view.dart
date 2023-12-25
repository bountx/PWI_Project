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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: appointment.color,
      ),
      width: calendarAppointmentDetails.bounds.width,
      height: calendarAppointmentDetails.bounds.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: <Widget>[
            Text(
              appointment.subject,
            ),
            Checkbox(value: false, onChanged: (bool? new_value) {})
          ],
        ),
      ),
    );
  } else {
    return Container(
      width: calendarAppointmentDetails.bounds.width,
      height: calendarAppointmentDetails.bounds.height,
      color: appointment.color,
      child: Text(
        appointment.subject,
      ),
    );
  }
}
