import 'package:flutter/material.dart';

class EntryPayload {
  String title;
  String price;
  String transactionCategory;
  DateTime date;
  String transactionType;
  String userId;

  EntryPayload(
      {required this.title,
      required this.userId,
      required this.price,
      required this.transactionCategory,
      required this.date,
      required this.transactionType});
}
