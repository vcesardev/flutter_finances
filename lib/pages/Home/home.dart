import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/entries_collection.dart';
import 'package:flutter_finances/config/month_data_collection.dart';
import 'package:flutter_finances/pages/Home/widgets/EntryListItem/entry_list_item.dart';
import 'package:flutter_finances/pages/Home/widgets/MonthDataCard/month_data_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Olá,", style: TextStyle(fontSize: 18)),
            Text(
              "Vitor",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.power_settings_new,
                color: Colors.orange,
              ))
        ],
      ),
      body: Container(
        color: CustomColors().gray,
        child: Column(
          children: [
            Container(
              color: CustomColors().blue,
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                key: UniqueKey(),
                children: MonthDataCollection().getMonthData.map((data) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MonthDataCard(
                      monthData: data,
                    ),
                  );
                }).toList(), // Converte o resultado do map para uma lista de widgets
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Listagem",
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColors().title,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: ListView(
                  key: UniqueKey(),
                  children: EntryCollection().getEntries.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EntryListItem(
                        entry: item,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
