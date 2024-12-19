import 'package:flutter/material.dart';
import 'package:flutter_finances/models/category_sum.dart';
import 'package:flutter_finances/models/entry.dart';

class EntriesProvider extends ChangeNotifier {
  List<Entry> _entries = [];

  List<Entry> get getEntries => _entries;

  void setEntries(List<Entry> entries) {
    _entries = entries;
    notifyListeners();
  }

  Map<String, Color> categoryColors = {
    "vendas": Colors.green,
    "entretenimento": Colors.cyan[200]!,
    "alimentacao": Colors.deepOrange[400]!,
    "contas": Colors.indigoAccent,
    "roupas": Colors.deepOrange[100]!,
    "aleatorio": Colors.yellow,
  };
  Map<String, String> categoryNames = {
    "vendas": "Vendas",
    "entretenimento": "Rolês",
    "alimentacao": "Alimentação",
    "contas": "Contas",
    "roupas": "Roupas",
    "aleatorio": "Outros",
  };

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

  List<CategorySum> getOverallCategoriesSum() {
    Map<String, double> categoriesSum = {};

    for (var entry in _entries) {
      // ignore: unused_local_variable
      String category = entry.transactionCategory;
      double price = double.parse(entry.price);

      categoriesSum[category] = (categoriesSum[category] ?? 0) + price;
    }

    List<CategorySum> results = categoriesSum.entries.map((entry) {
      return CategorySum(
        category: categoryNames[entry.key] ?? "Teste",
        total: entry.value,
        color: categoryColors[entry.key] ?? Colors.black,
      );
    }).toList();

    return results;
  }
}
