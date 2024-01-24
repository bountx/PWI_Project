import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Note {
  final String id;
  final String title;
  final String stringContent;
  final dynamic jsonContent;
  final Color color;
  final DateTime date;

  //Convert the note to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'stringContent': stringContent,
        'jsonContent': jsonContent,
        'color': color.value,
        'date': DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
      };

  //Create a Note from json
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        json['id'],
        json['title'],
        json['stringContent'],
        json['jsonContent'],
        Color(json['color']),
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(json['date']),
      );

  Note(this.id, this.title, this.stringContent, this.jsonContent, this.color,
      this.date);
}
