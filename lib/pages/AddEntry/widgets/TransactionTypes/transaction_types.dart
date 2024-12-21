import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/custom_month_colors_collection.dart';

class TransactionTypesRow extends StatelessWidget {
  const TransactionTypesRow(
      {super.key,
      required this.transactionType,
      required this.onPressTransactionType});

  final String transactionType;
  final Function onPressTransactionType;

  void onPressTransaction(String type) {
    onPressTransactionType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            onPressTransaction("income");
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              color: transactionType == 'income'
                  ? Colors.green[100]
                  : Colors.transparent,
              border: Border.all(width: 0.3, color: CustomColors().text),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton.icon(
              onPressed: () {
                onPressTransaction("income");
              },
              icon: CustomMonthColorsCollection().buildMonthIcon('Entradas'),
              label: Text(
                'Entrada',
                style: TextStyle(fontSize: 14, color: CustomColors().title),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onPressTransaction("outcome");
          },
          child: Container(
            padding: EdgeInsets.all(6),
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              color: transactionType == 'outcome'
                  ? Colors.red[100]
                  : Colors.transparent,
              border: Border.all(width: 0.3, color: CustomColors().text),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton.icon(
              onPressed: () {
                onPressTransaction("outcome");
              },
              icon: CustomMonthColorsCollection().buildMonthIcon('Saídas'),
              label: Text(
                'Saída',
                style: TextStyle(fontSize: 14, color: CustomColors().title),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
