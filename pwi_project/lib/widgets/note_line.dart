import 'package:flutter/material.dart';
import 'package:pwi_project/model/note.dart';

class NoteLine extends StatelessWidget {
  final Note note;
  final int? index;

  const NoteLine(
      {super.key,
      required this.note,
      this.index,}
      );

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width / 5 - 30;
    return SizedBox(
      height: containerSize,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: containerSize,
            width: containerSize,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 15 - 30,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width / 5 - 40,
              //width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      note.title.length > 17
                          ? '${note.title.substring(0, 17)}...'
                          : note.title,
                      // !!mediaquery to be implemented
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
