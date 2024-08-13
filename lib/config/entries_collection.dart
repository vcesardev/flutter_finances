import 'package:flutter/material.dart';
import 'package:flutter_finances/models/entry.dart';

class EntryCollection {
  final List<Entry> _entry = [
    Entry(
        title: "Desenvolvimento de sites",
        value: 10000,
        category: "Vendas",
        date: "13/04/2020",
        icon: Icons.attach_money,
        type: "income"),
    Entry(
        title: "Pizza",
        value: 80,
        category: "Alimentação",
        date: "13/04/2020",
        icon: Icons.restaurant,
        type: "outcome"),
    Entry(
        title: "Cartões",
        value: 500,
        category: "Despesas Mensais",
        date: "13/04/2020",
        icon: Icons.home,
        type: "outcome"),
    Entry(
        title: "Ingresso Music On",
        value: 120,
        category: "Rolês",
        date: "13/04/2020",
        icon: Icons.celebration,
        type: "outcome"),
    Entry(
        title: "Casaco",
        value: 200,
        category: "Roupas",
        date: "13/04/2020",
        icon: Icons.checkroom,
        type: "outcome"),
    Entry(
        title: "Cimento Obra",
        value: 150,
        category: "Miscelânea",
        date: "13/04/2020",
        icon: Icons.shopping_cart,
        type: "outcome"),
  ];

  List<Entry> get getEntries {
    return _entry;
  }

  int getTotalIncomes() {
    int value = 0;
    _entry.forEach((item) {
      if (item.type == 'income') {
        value += item.value;
      }
    });

    return value;
  }

  int getTotalOutcomes() {
    int value = 0;
    _entry.forEach((item) {
      if (item.type == 'outcome') {
        value += item.value;
      }
    });

    return value;
  }

  int getTotalBalance() {
    int value = 0;
    int incomeValue = getTotalIncomes();
    int outcomeValue = getTotalOutcomes();

    value = incomeValue - outcomeValue;

    return value;
  }
}
