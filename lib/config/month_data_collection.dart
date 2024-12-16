import 'package:flutter_finances/config/entries_collection.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/models/month_data.dart';
import 'package:flutter_finances/utils/masks.dart';

class MonthDataCollection {
  List<Entry> entries;

  late final List<MonthData> _monthData;

  MonthDataCollection({required this.entries}) {
    _monthData = [
      MonthData(
        type: 'Entradas',
        value: EntryCollection().getTotalIncomes(entries),
        date: entries.isNotEmpty && getMostRecentEntry("income") != null
            ? Masks().formatDateTime(getMostRecentEntry("income")!.date)
            : "Sem dados",
      ),
      MonthData(
        type: 'Saídas',
        value: EntryCollection().getTotalOutcomes(entries),
        date: entries.isNotEmpty && getMostRecentEntry("outcome") != null
            ? Masks().formatDateTime(getMostRecentEntry("outcome")!.date)
            : "Sem dados",
      ),
      MonthData(
        type: 'Total',
        value: EntryCollection().getTotalBalance(entries),
        date: entries.isNotEmpty
            ? Masks().formatDateTime(entries.first.date)
            : "Sem dados",
      ),
    ];
  }

  List<MonthData> get getMonthData {
    return _monthData;
  }

  Entry? getMostRecentEntry(String type) {
    List<Entry> filteredEntries =
        entries.where((entry) => entry.transactionType == type).toList();

    if (filteredEntries.isEmpty) {
      return null;
    }

    filteredEntries.sort((a, b) => b.date.compareTo(a.date));

    return filteredEntries.first;
  }
}
