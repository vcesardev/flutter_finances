import 'package:intl/intl.dart';

class Masks {
  String formatValueToCurrency(double value) {
    final String stringValue = value.toStringAsFixed(0);

    final String formattedValue = stringValue.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.');

    return 'R\$ $formattedValue,00';
  }

  String formatValueToPrice(double value) {
    final int roundedValue = value.round();

    final String stringValue = roundedValue.toString();

    final String formattedValue = stringValue.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.');

    return '$formattedValue,00';
  }

  String formatDateTime(DateTime date) {
    String formattedDate = DateFormat("dd/MM/yyyy").format(date);

    return formattedDate;
  }
}
