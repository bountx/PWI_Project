import 'package:flutter/material.dart';

class TaskManagerScreen extends StatelessWidget {
  TaskManagerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(153, 217, 234, 1.0),
      body: Center(
        child: Column(
            verticalDirection: VerticalDirection.down,
            children:
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // tablica.add(Przycisk());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.blueAccent,
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              'New task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          )),
    );
  }
}


Widget MyButtom(String name, String description) {
  return Container(
    width: 375,
    padding: EdgeInsets.all(30.0),
    decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.transparent),
        color: Color.fromRGBO(235, 235, 140, 1.0),
        borderRadius: BorderRadius.circular(20.0),

    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(name),
        Text(description),
      ],
    ),
  );
}
