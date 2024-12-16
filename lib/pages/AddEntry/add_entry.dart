import 'package:flutter/material.dart';

import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/config/entry_categories.dart';
import 'package:flutter_finances/models/entry_payload.dart';
import 'package:flutter_finances/pages/AddEntry/widgets/Input/input.dart';
import 'package:flutter_finances/pages/AddEntry/widgets/TransactionTypes/transaction_types.dart';
import 'package:flutter_finances/services/entries.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  String? _transactionOption;
  String _transactionType = "";
  DateTime _selectedDate = DateTime(0);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _dateController.dispose();
  }

  void displayErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: CustomColors().red,
      ),
    );
  }

  void displayToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: CustomColors().blue,
      ),
    );
  }

  void onPressTransactionCategory(String type) {
    setState(() {
      _transactionType = type;
    });
  }

  String validateInputs() {
    if (_nameController.text.isEmpty) {
      return "Preencha o campo nome corretamente";
    }

    if (_priceController.text.isEmpty ||
        double.tryParse(_priceController.text) == null) {
      return "Preencha o campo de preço corretamente.";
    }

    if (_transactionType.isEmpty) {
      return "Selecione uma transação para prosseguir.";
    }

    if (_selectedDate.year == 0) {
      return "Selecione uma data para prosseguir.";
    }

    if (_transactionOption == null || _transactionOption!.isEmpty) {
      return "Selecione uma categoria para prosseguir.";
    }

    return "";
  }

  void clearStates() {
    _priceController.clear();
    _nameController.clear();
    setState(() {
      _transactionType = "";
      _transactionOption = null;
    });
  }

  void onPressSend() async {
    String errorMessage = validateInputs();
    if (errorMessage.isNotEmpty) {
      displayErrorToast(errorMessage);
      return;
    }

    EntryPayload entryPayload = EntryPayload(
        title: _nameController.text,
        price: _priceController.text,
        transactionCategory: _transactionOption!,
        date: _selectedDate,
        transactionType: _transactionType);

    try {
      await EntriesService().addEntry(entryPayload);
      displayToast("Registro adicionado com sucesso!");
      clearStates();
    } catch (e) {
      print("error add entry: $e");
      displayErrorToast(
          "Houve um erro para adicionar o registro, tente novamente!");
    }
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
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
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
                      enabled: true,
                      hintText: "Nome",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  EntryInput(
                      inputController: _priceController,
                      enabled: true,
                      hintText: "Preço",
                      textInputType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickDate(context);
                    },
                    child: EntryInput(
                        inputController: _dateController,
                        enabled: false,
                        hintText: "Data",
                        textInputType: TextInputType.text),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TransactionTypesRow(
                      transactionType: _transactionType,
                      onPressTransactionType: onPressTransactionCategory),
                  const SizedBox(
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
                      value: _transactionOption,
                      hint: Text('Categorias'),
                      items: EntryCategoriesCollection().getEntryCategories,
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue.isNotEmpty) {
                          setState(() {
                            _transactionOption = newValue;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                      ),
                      isExpanded: true,
                      underline:
                          const SizedBox(), // Removes the default underline.
                      dropdownColor: Colors.white,
                      style: const TextStyle(
                          color: Colors.black, fontFamily: 'Poppins'),
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
                    onPressed: () {
                      onPressSend();
                    },
                    child: const Text(
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
