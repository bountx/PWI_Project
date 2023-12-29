import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import '../model/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MyCheckbox(),
        Expanded(
          child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              //width: 300,
              //height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: task.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
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
    return isChecked ? Colors.yellow[700] : Colors.amberAccent;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      splashColor: Colors.amber[100],
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
