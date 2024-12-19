import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';

class EntryCategoriesCollection {
  final List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      value: 'vendas',
      child: Row(
        children: <Widget>[
          Icon(Icons.attach_money, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Vendas'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'alimentacao',
      child: Row(
        children: <Widget>[
          Icon(Icons.restaurant, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Alimentação'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'contas',
      child: Row(
        children: <Widget>[
          Icon(Icons.home, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Contas'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'entretenimento',
      child: Row(
        children: <Widget>[
          Icon(Icons.celebration, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Rolês'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'roupas',
      child: Row(
        children: <Widget>[
          Icon(Icons.checkroom, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Roupas'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'aleatorio',
      child: Row(
        children: <Widget>[
          Icon(Icons.shopping_bag, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Outros'),
        ],
      ),
    ),
  ];

  List<DropdownMenuItem<String>> get getEntryCategories {
    return _dropdownItems;
  }
}
