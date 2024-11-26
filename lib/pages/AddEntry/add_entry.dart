import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/custom_month_colors_collection.dart';
import 'package:flutter_finances/config/entry_categories.dart';
import 'package:flutter_finances/pages/AddEntry/widgets/Input/input.dart';
import 'package:flutter_finances/utils/masks.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  String? _selectedValue;
  String? _selectedOption;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.82,
          padding: EdgeInsets.all(16),
          color: CustomColors().gray,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  EntryInput(
                      inputController: _nameController,
                      hintText: "Nome",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  EntryInput(
                      inputController: _priceController,
                      hintText: "Preço",
                      textInputType: TextInputType.number),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedOption = 'income';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: _selectedOption == 'income'
                                ? Colors.green[100]
                                : Colors.transparent,
                            border: Border.all(
                                width: 0.3, color: CustomColors().text),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                _selectedOption = 'income';
                              });
                            },
                            icon: CustomMonthColorsCollection()
                                .buildMonthIcon('Entradas'),
                            label: Text(
                              'Income',
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors().title),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedOption = 'outcome';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: _selectedOption == 'outcome'
                                ? Colors.red[100]
                                : Colors.transparent,
                            border: Border.all(
                                width: 0.3, color: CustomColors().text),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                _selectedOption = 'outcome';
                              });
                            },
                            icon: CustomMonthColorsCollection()
                                .buildMonthIcon('Saídas'),
                            label: Text(
                              'Outcome',
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors().title),
                            ),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    width: double
                        .infinity, // This makes the dropdown occupy the full width of the parent container.
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      hint: Text('Categorias'),
                      items: EntryCategoriesCollection().getEntryCategories,
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
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
