import 'package:flutter/material.dart';
import 'package:flutter_finances/models/entry.dart';

class EntryCollection {
  double getTotalIncomes(List<Entry> entries) {
    double value = 0;
    entries.forEach((item) {
      if (item.transactionType == 'income') {
        value += double.parse(item.price);
      }
    });

    return value;
  }

  double getTotalOutcomes(List<Entry> entries) {
    double value = 0;
    entries.forEach((item) {
      if (item.transactionType == 'outcome') {
        value += double.parse(item.price);
      }
    });

    return value;
  }

  double getTotalBalance(List<Entry> entries) {
    double value = 0;
    double incomeValue = getTotalIncomes(entries);
    double outcomeValue = getTotalOutcomes(entries);

    value = incomeValue - outcomeValue;

    return value;
  }
}
