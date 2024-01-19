import 'dart:ui';

import 'package:flutter/material.dart';

class Note {
  final String title;
  final String stringContent;
  final jsonContent;
  final Color color;
  final DateTime date;

  Note(this.title, this.stringContent,this.jsonContent, this.color, this.date);
}
