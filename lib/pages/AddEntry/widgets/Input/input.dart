import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';

class EntryInput extends StatefulWidget {
  const EntryInput(
      {super.key,
      required this.inputController,
      required this.hintText,
      required this.textInputType});

  final TextEditingController inputController;
  final String hintText;
  final TextInputType? textInputType;

  @override
  State<EntryInput> createState() => _EntryInputState();
}

class _EntryInputState extends State<EntryInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      style: TextStyle(fontSize: 14, color: CustomColors().text),
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),
    );
  }
}
