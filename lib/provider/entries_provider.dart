import 'package:flutter/material.dart';
import 'package:flutter_finances/models/entry.dart';

class EntriesProvider extends ChangeNotifier {
  List<Entry> _entries = [];

  List<Entry> get getEntries => _entries;

  void setEntries(List<Entry> entries) {
    _entries = entries;
    notifyListeners();
  }

  Map<String, int> getTransactionCountForSpecificCategories() {
    const List<String> specificCategories = [
      'vendas',
      'alimentacao',
      'contas',
      'entretenimento',
      'roupas',
      'aleatorio',
    ];

    Map<String, int> categoryCount = {
      for (var category in specificCategories) category: 0,
    };

    for (var entry in _entries) {
      if (categoryCount.containsKey(entry.transactionCategory)) {
        categoryCount[entry.transactionCategory] =
            categoryCount[entry.transactionCategory]! + 1;
      }
    }

    return categoryCount;
  }
}
