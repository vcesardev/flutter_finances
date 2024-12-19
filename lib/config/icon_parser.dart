import 'package:flutter/material.dart';
import 'package:flutter_finances/models/icon_info.dart';

class IconParser {
  List<IconInfo> icons = [
    IconInfo(icon: Icons.attach_money, value: "vendas", title: "Vendas"),
    IconInfo(
        icon: Icons.restaurant, value: "alimentacao", title: "Alimentação"),
    IconInfo(icon: Icons.home, value: "contas", title: "Contas"),
    IconInfo(
        icon: Icons.celebration,
        value: "entretenimento",
        title: "Entretenimento"),
    IconInfo(icon: Icons.checkroom, value: "roupas", title: "Roupas"),
    IconInfo(icon: Icons.shopping_bag, value: "aleatorio", title: "Aleatório")
  ];

  IconData fetchIcon(String value) {
    IconInfo data;

    data = icons.firstWhere((icon) => icon.value == value);

    return data.icon;
  }

  String fetchCategory(String value) {
    IconInfo data;

    data = icons.firstWhere((icon) => icon.value == value);

    return data.title;
  }
}
