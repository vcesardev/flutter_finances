import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/pages/AddEntry/add_entry.dart';
import 'package:flutter_finances/pages/Home/home.dart';
import 'package:flutter_finances/pages/MonthOverall/month_overall.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Replace with your actual home page widget
    AddEntryScreen(),
    MonthOverall() // Replace with your actual add entry screen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Listagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Resumo do mês',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors().blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
