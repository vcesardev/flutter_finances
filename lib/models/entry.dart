import 'package:flutter/material.dart';

class Entry {
  String title;
  String price;
  String transactionCategory;
  DateTime date;
  String transactionType;
  String id;
  String userId;

  Entry(
      {required this.title,
      required this.price,
      required this.transactionCategory,
      required this.date,
      required this.transactionType,
      required this.id,
      required this.userId});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'transactionCategory': transactionCategory,
      'date': date.toIso8601String(),
      'transactionType': transactionType,
      'id': id,
    };
  }
}
