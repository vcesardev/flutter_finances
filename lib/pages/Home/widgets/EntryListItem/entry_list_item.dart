import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/icon_parser.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/utils/masks.dart';

class EntryListItem extends StatelessWidget {
  const EntryListItem({super.key, required this.entry});

  final Entry entry;

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
                  entry.title,
                  style: TextStyle(fontSize: 14, color: CustomColors().title),
                ),
                Text(
                  Masks().formatValueToCurrency(double.parse(entry.price)),
                  style: TextStyle(
                      color: entry.transactionType == 'income'
                          ? CustomColors().green
                          : CustomColors().red,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      IconParser().fetchIcon(entry.transactionCategory),
                      color: CustomColors().text,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      IconParser().fetchCategory(entry.transactionCategory),
                      style:
                          TextStyle(color: CustomColors().text, fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  Masks().formatDateTime(entry.date),
                  style: TextStyle(color: CustomColors().text, fontSize: 14),
                ),
              ],
            )
          ],
        ));
  }
}
