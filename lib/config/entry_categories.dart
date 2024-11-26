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
      value: 'alimentação',
      child: Row(
        children: <Widget>[
          Icon(Icons.restaurant, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Alimentação'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'despesas',
      child: Row(
        children: <Widget>[
          Icon(Icons.home, color: CustomColors().text),
          SizedBox(width: 10),
          Text('Despesas'),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'festas',
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
          Text('Aleatório'),
        ],
      ),
    ),
  ];

  List<DropdownMenuItem<String>> get getEntryCategories {
    return _dropdownItems;
  }
}
