import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/task_view_model.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget(this.name, this.description, this.day, this.background,
      this.isDone, this.index,
      {super.key});

  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone;
  int index;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Container(
            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
            width: 300,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
              Provider.of<TaskList>(context, listen: false).tasks.last.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: (){
                  print(Provider.of<TaskList>(context, listen: false).tasks.last.description);
                //placeholder! Goal: Should provide a tasks description, but need indexes for it
              },
            )
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

  Color getColor() {
    return isChecked ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 90,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: getColor()
        ),
        child: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(getColor()),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ),
    );
  }
}
