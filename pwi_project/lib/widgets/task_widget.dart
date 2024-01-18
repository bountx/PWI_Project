import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/task.dart';
import '../view/task_view_screen.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskViewWidget(
                          task: task,
                        )));
          },
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: task.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd').format(task.day.toLocal()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    task.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        MyCheckbox(),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  Color? getColor() {
    return isChecked ? Theme.of(context).colorScheme.surfaceVariant : Theme.of(context).colorScheme.surface;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      splashColor: Theme.of(context).splashColor,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: getColor(),
        ),
        child: Center(
          child: isChecked
              ? const Icon(
                  Icons.check,
                  size: 24.0,
                  color: Colors.black,
                )
              : null,
        ),
      ),
    );
  }
}
