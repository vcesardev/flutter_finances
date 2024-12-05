import 'package:flutter/material.dart';

class EntryPayload {
  String title;
  String price;
  String transactionCategory;
  DateTime date;
  String transactionType;

  EntryPayload(
      {required this.title,
      required this.price,
      required this.transactionCategory,
      required this.date,
      required this.transactionType});
}
