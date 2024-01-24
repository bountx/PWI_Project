import 'package:flutter/material.dart';
import 'package:pwi_project/model/note.dart';

import '../view_model/notelist_view_model.dart';

class NoteLine extends StatelessWidget {
  final Note note;
  final int index;

  const NoteLine({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double containerSize = 40.0;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        handleTap(context, index);
      },
      child: SizedBox(
        height: containerSize,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              height: containerSize,
              width: containerSize,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(13.0),
              ),
            ),
            Expanded(
              child: Container(
                height: screenWidth / 5 - 40,
                //width: screenWidth / 1.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          note.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
