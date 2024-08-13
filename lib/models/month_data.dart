import 'package:flutter_finances/utils/masks.dart';

class MonthData {
  String type;
  int value;
  String date;

  MonthData({required this.type, required this.value, required this.date});

  String convertValue() {
    return Masks().formatValueToCurrency(value);
  }
}
