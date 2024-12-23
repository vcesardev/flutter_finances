import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_finances/models/transaction_category.dart';

class PiechartSection extends StatelessWidget {
  const PiechartSection(
      {super.key, required this.data, required this.entriesTotalOutcomePrice});
  final TransactionCategoryCount data;
  final double entriesTotalOutcomePrice;

  @override
  Widget build(BuildContext context) {
    String convertValueToPercentage(double value) {
      final data =
          ((value / entriesTotalOutcomePrice) * 100).toStringAsFixed((2));
      return data;
    }

    return PieChart(
      PieChartData(
        centerSpaceColor: Colors.transparent,
        sections: [
          PieChartSectionData(
            color: Colors.green,
            value: data.vendas.toDouble(),
            title: "${convertValueToPercentage(data.vendas)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.deepOrange,
            value: data.alimentacao.toDouble(),
            title: "${convertValueToPercentage(data.alimentacao)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.indigoAccent,
            value: data.contas.toDouble(),
            title: "${convertValueToPercentage(data.contas)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.cyan[200],
            value: data.entretenimento.toDouble(),
            title: "${convertValueToPercentage(data.entretenimento)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.deepOrange[100],
            value: data.roupas.toDouble(),
            title: "${convertValueToPercentage(data.roupas)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.yellow,
            value: data.aleatorio.toDouble(),
            title: "${convertValueToPercentage(data.aleatorio)}%",
            radius: 60,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
    );
  }
}
