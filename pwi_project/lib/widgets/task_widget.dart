import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../view/task_view_screen.dart';
import '../view_model/task_view_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final bool showDate;
  final int index;

  const TaskWidget(
      {super.key,
      required this.task,
      this.showDate = true,
      required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyCheckbox(
          task: task,
          index: index,
        ),
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
              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: screenWidth - 100.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: task.color,
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (showDate)
                      Text(
                        DateFormat('yyyy-MM-dd').format(task.date.toLocal()),
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

class MyCheckbox extends StatelessWidget {
  final Task task;
  final int index;

  const MyCheckbox({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Provider.of<TaskViewModel>(context, listen: false).toggleDone(task);
      },
      splashColor: Theme.of(context).splashColor,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: task.isDone
              ? Theme.of(context).colorScheme.surfaceVariant
              : Theme.of(context).colorScheme.surface,
        ),
        child: Center(
          child: task.isDone
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
