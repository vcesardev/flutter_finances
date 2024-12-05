import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/models/custom_month_colors.dart';

class CustomMonthColorsCollection {
  final List<CustomMonthColors> _customColors = [
    CustomMonthColors(
      color: CustomColors().green,
      type: 'Entradas',
      icon: Icons.arrow_upward_outlined,
    ),
    CustomMonthColors(
      color: CustomColors().red,
      type: 'Saídas',
      icon: Icons.arrow_downward_outlined,
    ),
    CustomMonthColors(
      color: CustomColors().green,
      type: 'Total',
      icon: Icons.attach_money,
    ),
  ];

  Widget buildMonthIcon(String type) {
    final monthColor = _customColors.firstWhere(
      (color) => color.type == type,
      orElse: () => CustomMonthColors(
        color: Colors.grey,
        type: '',
        icon: Icons.help_outline,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: monthColor.color),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Icon(
        monthColor.icon,
        color: monthColor.color,
      ),
    );
  }
}
