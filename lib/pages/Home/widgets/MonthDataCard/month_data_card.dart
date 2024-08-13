import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/custom_month_colors_collection.dart';
import 'package:flutter_finances/utils/masks.dart';

class MonthDataCard extends StatelessWidget {
  const MonthDataCard(
      {super.key, required this.type, required this.value, required this.date});

  final String type;
  final int value;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: TextStyle(fontSize: 14, color: CustomColors().title),
                ),
                MonthIcon(
                  type: type,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              Masks().formatValueToCurrency(value),
              style: TextStyle(color: CustomColors().title, fontSize: 26),
            ),
            Text(
              "Última entrada dia $date",
              style: TextStyle(color: CustomColors().text, fontSize: 12),
            ),
          ],
        ));
  }
}

class MonthIcon extends StatelessWidget {
  const MonthIcon({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    // Instanciar a classe para acessar a função
    final customMonthColorsCollection = CustomMonthColorsCollection();

    // Usar a função buildMonthIcon para retornar o widget
    return customMonthColorsCollection.buildMonthIcon(type);
  }
}
