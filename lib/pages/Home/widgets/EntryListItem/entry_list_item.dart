import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';

class EntryListItem extends StatelessWidget {
  const EntryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(14),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Desenvolvimento de site",
                  style: TextStyle(fontSize: 14, color: CustomColors().title),
                ),
                Text(
                  "R\$ 12.400,00",
                  style: TextStyle(color: CustomColors().green, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: CustomColors().text,
                    ),
                    Text(
                      "Vendas",
                      style:
                          TextStyle(color: CustomColors().text, fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  "13/4/2020",
                  style: TextStyle(color: CustomColors().text, fontSize: 14),
                ),
              ],
            )
          ],
        ));
  }
}
