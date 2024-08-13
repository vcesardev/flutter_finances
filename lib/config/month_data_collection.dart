import 'package:flutter_finances/models/month_data.dart';

class MonthDataCollection {
  final List<MonthData> _monthData = [
    MonthData(type: 'Entradas', value: 17320, date: "13/08/2024"),
    MonthData(type: 'Saídas', value: 8000, date: "13/08/2024"),
    MonthData(type: 'Total', value: 9320, date: "13/08/2024"),
  ];

  List<MonthData> get getMonthData {
    return _monthData;
  }
}
