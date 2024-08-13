import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/custom_month_colors_collection.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  String? _selectedValue;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // list
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: CustomColors().gray,
        child: Column(children: [
          TextField(
            controller: _nameController,
            style: TextStyle(fontSize: 14, color: CustomColors().text),
            decoration: InputDecoration(
              hintText: "Nome",
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _priceController,
            style: TextStyle(fontSize: 14, color: CustomColors().text),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Preço",
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                width: MediaQuery.of(context).size.width * 0.43,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: CustomColors().text),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon:
                      CustomMonthColorsCollection().buildMonthIcon('Entradas'),
                  label: Text(
                    'Income',
                    style: TextStyle(fontSize: 14, color: CustomColors().title),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6),
                width: MediaQuery.of(context).size.width * 0.43,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: CustomColors().text),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: CustomMonthColorsCollection().buildMonthIcon('Saídas'),
                  label: Text(
                    'Outcome',
                    style: TextStyle(fontSize: 14, color: CustomColors().title),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            width: double
                .infinity, // This makes the dropdown occupy the full width of the parent container.
            child: DropdownButton<String>(
              value: _selectedValue,
              hint: Text('Categorias'),
              items: _dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 28,
              ),
              isExpanded:
                  true, // Ensures the dropdown menu items occupy the full width.
              underline: SizedBox(), // Removes the default underline.
              dropdownColor: Colors
                  .white, // Sets the background color of the dropdown items.
              style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
            ),
          ),
        ]),
      ),
    );
  }
}
