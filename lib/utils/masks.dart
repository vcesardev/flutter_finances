class Masks {
  String formatValueToCurrency(int value) {
    final String stringValue = value.toString();

    final String formattedValue = stringValue.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.');

    return 'R\$ $formattedValue,00';
  }
}
