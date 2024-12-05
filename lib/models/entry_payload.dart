import 'package:flutter/material.dart';

class EntryPayload {
  String title;
  String value;
  String category;
  DateTime date;
  String type;

  EntryPayload(
      {required this.title,
      required this.value,
      required this.category,
      required this.date,
      required this.type});
}
