import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/models/transaction_category.dart';
import 'package:flutter_finances/pages/MonthOverall/widgets/month_category.dart';
import 'package:flutter_finances/provider/entries_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_finances/pages/MonthOverall/widgets/piechart_section.dart';

class MonthOverall extends StatefulWidget {
  const MonthOverall({super.key});

  @override
  State<MonthOverall> createState() => _MonthOverallState();
}

class _MonthOverallState extends State<MonthOverall> {
  @override
  Widget build(BuildContext context) {
    final entriesProvider = Provider.of<EntriesProvider>(context);

    final chartData =
        entriesProvider.getTransactionCountForSpecificCategories();
    final entriesTotalAmount = entriesProvider.getEntries.length;
    TransactionCategoryCount data = TransactionCategoryCount.fromMap(chartData);
    final categoriesSum = entriesProvider.getOverallCategoriesSum();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumo do mês"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: CustomColors().gray,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: PiechartSection(
                      data: data, entriesTotalAmount: entriesTotalAmount),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    key: UniqueKey(),
                    children: categoriesSum.map((category) {
                      return MonthCategory(
                        category: category,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
