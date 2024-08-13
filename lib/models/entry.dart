import 'package:flutter/material.dart';

class Entry {
  String title;
  int value;
  String category;
  String date;
  String type;
  IconData icon;

  Entry(
      {required this.title,
      required this.value,
      required this.category,
      required this.date,
      required this.icon,
      required this.type});
}
