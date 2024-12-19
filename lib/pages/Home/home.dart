import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/month_data_collection.dart';
import 'package:flutter_finances/models/entry.dart';
import 'package:flutter_finances/pages/Home/widgets/EntryListItem/entry_list_item.dart';
import 'package:flutter_finances/pages/Home/widgets/MonthDataCard/month_data_card.dart';
import 'package:flutter_finances/provider/entries_provider.dart';
import 'package:flutter_finances/services/entries.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  DateTime _selectedDate = DateTime(0);

  List<Entry> _entries = [];

  Future<void> _loadEntries(DateTime datetime, BuildContext context) async {
    final entriesProvider =
        Provider.of<EntriesProvider>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    try {
      List<Entry> entries = await EntriesService().fetchEntries(datetime);

      Future.delayed(const Duration(seconds: 2), () {
        entriesProvider.setEntries(entries);
        setState(() {
          isLoading = false;
          _entries = entries;
        });
      });
    } catch (e) {
      // Handle any errors
      setState(() {
        isLoading = false;
      });
      print("Error fetching entries: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access context here
      _loadEntries(
        DateTime.now(),
        context,
      );
    });
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _loadEntries(pickedDate, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá,",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                "Vitor",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.power_settings_new,
                color: Colors.orange,
              ))
        ],
      ),
      body: isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            )
          : Container(
              color: CustomColors().gray,
              child: Column(
                children: [
                  Container(
                    color: CustomColors().blue,
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      key: UniqueKey(),
                      children: MonthDataCollection(entries: _entries)
                          .getMonthData
                          .map((data) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MonthDataCard(
                            monthData: data,
                          ),
                        );
                      }).toList(), // Converte o resultado do map para uma lista de widgets
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Listagem",
                          style: TextStyle(
                            fontSize: 16,
                            color: CustomColors().title,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _pickDate(context);
                          },
                          icon: Icon(
                            Icons.calendar_month,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Listagem",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         color: CustomColors().title,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      child: ListView(
                        key: UniqueKey(),
                        children: _entries.map((item) {
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
