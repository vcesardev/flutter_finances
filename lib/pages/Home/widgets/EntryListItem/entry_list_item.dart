import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/icon_parser.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/utils/masks.dart';

class EntryListItem extends StatelessWidget {
  const EntryListItem(
      {super.key, required this.entry, required this.onPressDelete});

  final Entry entry;

  final Function onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.title,
                      style:
                          TextStyle(fontSize: 14, color: CustomColors().title),
                    ),
                    IconButton(
                        onPressed: () {
                          onPressDelete();
                        },
                        icon: Icon(Icons.delete_outline))
                  ],
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
