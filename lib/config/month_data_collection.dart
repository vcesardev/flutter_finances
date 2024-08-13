import 'package:flutter_finances/config/entries_collection.dart';
import 'package:flutter_finances/models/month_data.dart';

class MonthDataCollection {
  final List<MonthData> _monthData = [
    MonthData(
        type: 'Entradas',
        value: EntryCollection().getTotalIncomes(),
        date: "13/08/2024"),
    MonthData(
        type: 'Saídas',
        value: EntryCollection().getTotalOutcomes(),
        date: "13/08/2024"),
    MonthData(
        type: 'Total',
        value: EntryCollection().getTotalBalance(),
        date: "13/08/2024"),
  ];

  List<MonthData> get getMonthData {
    return _monthData;
  }
}
