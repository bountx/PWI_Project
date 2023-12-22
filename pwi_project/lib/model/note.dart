import 'dart:ui';
import 'package:flutter/material.dart';

class Note {
  final String title;
  final String content;
  final Color color;
  final DateTime date;

  Note(this.title, this.content, this.color, this.date);
}