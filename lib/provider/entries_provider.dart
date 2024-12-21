import 'package:flutter/material.dart';
import 'package:flutter_finances/models/category_sum.dart';
import 'package:flutter_finances/models/entry.dart';

class EntriesProvider extends ChangeNotifier {
  List<Entry> _entries = [];
  List<Entry> _outcomeEntries = [];
  double _totalOutcomePrice = 0;

  List<Entry> get getEntries => _entries;

  List<Entry> get getOutcomeEntries => _outcomeEntries;

  double get getOutcomeTotalPrice => _totalOutcomePrice;

  void setEntries(List<Entry> entries) {
    _entries = entries;
    _outcomeEntries =
        entries.where((entry) => entry.transactionType == "outcome").toList();
    for (var entry in entries) {
      if (entry.transactionType == "outcome") {
        _totalOutcomePrice = _totalOutcomePrice + double.parse(entry.price);
      }
    }
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

  Map<String, double> getTransactionCountForSpecificCategories() {
    const List<String> specificCategories = [
      'vendas',
      'alimentacao',
      'contas',
      'entretenimento',
      'roupas',
      'aleatorio',
    ];

    Map<String, double> categoryCount = {
      for (var category in specificCategories) category: 0,
    };

    for (var entry in _outcomeEntries) {
      if (categoryCount.containsKey(entry.transactionCategory)) {
        categoryCount[entry.transactionCategory] =
            categoryCount[entry.transactionCategory]! +
                double.parse(entry.price);
      }
    }

    return categoryCount;
  }

  List<CategorySum> getOverallCategoriesSum() {
    Map<String, double> categoriesSum = {};

    for (var entry in _outcomeEntries) {
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
