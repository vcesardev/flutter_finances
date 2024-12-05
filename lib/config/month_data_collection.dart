import 'package:flutter_finances/config/entries_collection.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/models/month_data.dart';

class MonthDataCollection {
  List<Entry> entries;

  late final List<MonthData> _monthData;

  MonthDataCollection({required this.entries}) {
    _monthData = [
      MonthData(
          type: 'Entradas',
          value: EntryCollection().getTotalIncomes(entries),
          date: "13/08/2024"),
      MonthData(
          type: 'Saídas',
          value: EntryCollection().getTotalOutcomes(entries),
          date: "13/08/2024"),
      MonthData(
          type: 'Total',
          value: EntryCollection().getTotalBalance(entries),
          date: "13/08/2024"),
    ];
  }

  List<MonthData> get getMonthData {
    return _monthData;
  }
}
