import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/task.dart';
import '../view/task_view_screen.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final bool showDate;

  const TaskWidget({super.key, required this.task, this.showDate = true});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyCheckbox(),
        Expanded(
          child: InkWell(
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
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: screenWidth-100.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: task.background,
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (showDate)
                      Text(
                        DateFormat('yyyy-MM-dd').format(task.day.toLocal()),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    Text(
                    task.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
    return isChecked
        ? Theme.of(context).colorScheme.surfaceVariant
        : Theme.of(context).colorScheme.surface;
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
