import 'package:flutter/material.dart';

class Entry {
  String title;
  String price;
  String transactionCategory;
  DateTime date;
  String transactionType;
  String id;

  Entry(
      {required this.title,
      required this.price,
      required this.transactionCategory,
      required this.date,
      required this.transactionType,
      required this.id});
}
